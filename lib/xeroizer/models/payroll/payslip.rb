module Xeroizer
  module Record
    module Payroll

      class PayslipModel < PayrollBaseModel
      end

      class Payslip < PayrollBase
        set_primary_key :payslip_id

        guid     :payslip_id
        guid     :employee_id
        guid     :pay_run_id
        string   :first_name
        string   :last_name
        string   :employee_group
        datetime :last_edited
        decimal  :net_pay
        decimal  :tax
        decimal  :super
        decimal  :reimbursements

        has_many :earnings_lines
        has_many :timesheet_earnings_lines
        has_many :deduction_lines
        has_many :leave_accrual_lines
        has_many :leave_earnings_lines
        has_many :reimbursement_lines
        has_many :superannuation_lines
        has_many :tax_lines

        validates_presence_of :payslip_id, :unless => :new_record?
      end
    end
  end
end
