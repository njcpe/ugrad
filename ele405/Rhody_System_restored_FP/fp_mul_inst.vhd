fp_mul_inst : fp_mul PORT MAP (
		clock	 => clock_sig,
		dataa	 => dataa_sig,
		datab	 => datab_sig,
		nan	 => nan_sig,
		overflow	 => overflow_sig,
		result	 => result_sig,
		underflow	 => underflow_sig,
		zero	 => zero_sig
	);
