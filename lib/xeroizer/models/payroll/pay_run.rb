module Xeroizer
  module Record
    module Payroll

      class PayRunModel < PayrollBaseModel
        set_permissions :read
      end

      class PayRun < PayrollBase
        PAY_RUN_STATUS = {
          'DRAFT'  => '',
          'POSTED' => ''
        } unless defined?(PAY_RUN_STATUS)
        PAY_RUN_STATUSES = PAY_RUN_STATUS.keys.sort

        set_primary_key :pay_run_id

        guid     :pay_run_id
        string   :pay_run_status
        date     :pay_run_period_start_date
        date     :pay_run_period_end_date
        date     :payment_date
        string   :payslip_message
        decimal  :wages
        decimal  :deductions
        decimal  :tax
        decimal  :reimbursement
        decimal  :net_pay
        guid     :payroll_calendar_id

        has_many :payslips

        validates_presence_of :pay_run_id, :unless => :new_record?
        validates_presence_of :pay_run_period_end_date, :pay_run_status
        validates_inclusion_of :pay_run_status, :in => PAY_RUN_STATUSES
      end
    end
  end
end
