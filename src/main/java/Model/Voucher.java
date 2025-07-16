package Model;

public class Voucher {
    private int voucherId;
    private String voucherText;

    // getters & setters

    public Voucher() {
    }

    public Voucher(int voucherId, String voucherText) {
        this.voucherId = voucherId;
        this.voucherText = voucherText;
    }

    public int getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(int voucherId) {
        this.voucherId = voucherId;
    }

    public String getVoucherText() {
        return voucherText;
    }

    public void setVoucherText(String voucherText) {
        this.voucherText = voucherText;
    }
}