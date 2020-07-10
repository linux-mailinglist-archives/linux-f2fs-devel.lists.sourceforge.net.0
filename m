Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D7221AD69
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 05:18:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtjYH-0002kc-PK; Fri, 10 Jul 2020 03:18:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jtjYG-0002kU-41
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 03:18:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TLUcgfD3vzj9e3+8HCJonIEbZ+/i+9gPCbAcc/AaAoA=; b=Zk7nclOA0XD4szb00XkeIZxzxD
 Sav1AFP7LLOOLge+z/E3xxAnu+0Jhbb2jdYIxxpnJEVwDUIe6OkrxVTFgrWua8rAmM3XyNYTntI2j
 OiLVled2IXi+wff3B4c39NtGZEV9kvxHOPqkchstYIKCPy8cUMM4QjrbUPoDgstW7WXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TLUcgfD3vzj9e3+8HCJonIEbZ+/i+9gPCbAcc/AaAoA=; b=F2GlMEddE7hDJGZNcEgMesA9SH
 38WGJ+8aC6pVtF8dlDWycYahtWZJLp8VwJMxZGNM4XbY/dNHNQSRT59h+uI5Kr3dN46DQyWXpeMCh
 oUY+EWHu8+AYaQgG5/4XWiBWu8Whiyo+fCUdQF7l9GHv+slm5PPUWk4MQPUAzfPnyjJE=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtjYB-001aDk-AL
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 03:18:16 +0000
Received: by mail-lj1-f193.google.com with SMTP id h22so4747211lji.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 09 Jul 2020 20:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TLUcgfD3vzj9e3+8HCJonIEbZ+/i+9gPCbAcc/AaAoA=;
 b=OiLdpIICkkdCExTqxehNMdW0XGdYvLF283Yg/MiIIyL6LH6V/AF3qDNbEGFpM4BgEL
 THMtJENwHsN5Xkl3lVtkh+XrShOrvqGvhLo1/CIGqWi9Im8FPgaYdrw1+uap0axzIbWb
 t5kjTyXP9yOdStfM+G0kzZpBOzXx4S0YG/bYM/VooVLvLLl1UJmw1FwlDv9sN+xz/v+3
 g17yc9mJURCJ7zpvsU+LBr/ku0k6gk11bR0x8iVYQTwhsJjsImi8M1WqhxFI1RXpes3r
 zsklDNjVE+8dfs9DymIY5ddzL337f2pFAqgszwLG7STArcA1wH6LZzpJ+D/NR8L2QevP
 ZGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TLUcgfD3vzj9e3+8HCJonIEbZ+/i+9gPCbAcc/AaAoA=;
 b=G0pq+Fx2gaNA/k6m3LH8HSSCF1fcrhIq0XQnabc85Qi7HMHe6WXnZIqzjDPU/6tMGj
 V9UgtnrY6wtat9nwISwpGH81eETP+b9EXvdHOXtHZzGAB1G9qMWrKPJ1JB42lulS2kFx
 arNKXT0OKJfwEgYaYup2xIovX/pC3ASlvf5wnsb1iB72fdsfOUpyaET0VYFXDNrKwwR2
 Vriy45KP7FcZgTd75Z4Im1ejpfJeUDIfzxLjfE2dbej82sH0QZkx5UyDj2jEABR8rzmQ
 Rq3tyo1K0GBVsQgC9pYdkxh7xmORFGamZiioVi2Z65cYOpwl5dY5BcAuLr5nsD5pzD6l
 yBZg==
X-Gm-Message-State: AOAM5319rPgRohbB9y4DsngdrhdbLRBL8E8l5eQBofO7z9lO7xGU/nCO
 Gia8swTtQ0w1LUxIU9vOLBXv6nYCnqvHDnGmajM=
X-Google-Smtp-Source: ABdhPJy2fEwacppAg+xY6cPAq454tX4tcJA5yUCm12WfM5rTh2UOBmq08fJgr37rqprJPJfZ6ePDPuOVwEh5bkGqF34=
X-Received: by 2002:a2e:7c07:: with SMTP id x7mr28142677ljc.166.1594351077346; 
 Thu, 09 Jul 2020 20:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200710021505.2405872-1-daeho43@gmail.com>
 <20200710030246.GA545837@google.com>
In-Reply-To: <20200710030246.GA545837@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 10 Jul 2020 12:17:46 +0900
Message-ID: <CACOAw_yJvQgDsLRd0-iJqXN06wDXmC3_OqKgKey7p=WeqxzMFA@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtjYB-001aDk-AL
Subject: Re: [f2fs-dev] [PATCH] f2fs: change the way of handling range.len
 in F2FS_IOC_SEC_TRIM_FILE
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

MS4gVGhlIHZhbGlkIGRhdGEgd2lsbCBiZSB3aXRoaW4gaV9zaXplLgoyLiBBbGwgdGhlIHRyaW0g
b3BlcmF0aW9ucyB3aWxsIGJlIGRvbmUgaW4gYSB1bml0IG9mIGJsb2NrLCBldmVuIGlmCmlfc2l6
ZSBpcyBub3QgYWxpZ25lZCB3aXRoIEJMS1NJWkUgbGlrZSB0aGUgYmVsb3cuCgogICAgICAgIGlu
ZGV4ID0gRjJGU19CWVRFU19UT19CTEsocmFuZ2Uuc3RhcnQpOwogICAgICAgIHBnX2VuZCA9IERJ
Vl9ST1VORF9VUChlbmRfYWRkciwgRjJGU19CTEtTSVpFKTsgICAgIDw9IEJMS1NJWkUgYWxpZ25l
ZAoKQXJlIHlvdSB3b3JyaWVkIGFib3V0IHRoZSBjYXNlIHRoYXQgc3VkZGVuIHBvd2VyLW9mZiBv
Y2N1cnMgd2hpbGUgYQpmaWxlIGlzIGJlaW5nIHRydW5jYXRlZD8KZXgpIDFHQiBmaWxlIGlzIGJl
aW5nIHRydW5jYXRlZCB0byA0S0IgLT4gc3VkZGVuIHBvd2VyLW9mZiAtPgppX3NpemUoNEtCKSwg
aV9ibG9ja3MobWF5YmUgc29tZXdoZXJlIGJldHdlZW4gNEtCIGFuZCAxR0IpCgoyMDIw64WEIDfs
m5QgMTDsnbwgKOq4iCkg7Jik7ZuEIDEyOjAyLCBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwu
b3JnPuuLmOydtCDsnpHshLE6Cj4KPiBPbiAwNy8xMCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiBG
cm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4KPiA+IENoYW5nZWQg
dGhlIHdheSBvZiBoYW5kbGluZyByYW5nZS5sZW4gb2YgRjJGU19JT0NfU0VDX1RSSU1fRklMRS4K
PiA+ICAxLiBBZGRlZCAtMSB2YWx1ZSBzdXBwb3J0IGZvciByYW5nZS5sZW4gdG8gc2lnbmlmeSB0
aGUgZW5kIG9mIGZpbGUuCj4gPiAgMi4gSWYgdGhlIGVuZCBvZiB0aGUgcmFuZ2UgcGFzc2VzIG92
ZXIgdGhlIGVuZCBvZiBmaWxlLCBpdCBtZWFucyB1bnRpbAo+ID4gICAgIHRoZSBlbmQgb2YgZmls
ZS4KPiA+ICAzLiBpZ25vcmVkIHRoZSBjYXNlIG9mIHRoYXQgcmFuZ2UubGVuIGlzIHplcm8gdG8g
cHJldmVudCB0aGUgZnVuY3Rpb24KPiA+ICAgICBmcm9tIG1ha2luZyBlbmRfYWRkciB6ZXJvIGFu
ZCB0cmlnZ2VyaW5nIGRpZmZlcmVudCBiZWhhdmlvdXIgb2YKPiA+ICAgICB0aGUgZnVuY3Rpb24u
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNv
bT4KPiA+IC0tLQo+ID4gIGZzL2YyZnMvZmlsZS5jIHwgMTYgKysrKysrKy0tLS0tLS0tLQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPiA+IGluZGV4IDM2
OGM4MGY4ZTJhMS4uMWM0NjAxZjk5MzI2IDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9maWxlLmMK
PiA+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4gPiBAQCAtMzgxMywyMSArMzgxMywxOSBAQCBzdGF0
aWMgaW50IGYyZnNfc2VjX3RyaW1fZmlsZShzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9u
ZyBhcmcpCj4gPiAgICAgICBmaWxlX3N0YXJ0X3dyaXRlKGZpbHApOwo+ID4gICAgICAgaW5vZGVf
bG9jayhpbm9kZSk7Cj4gPgo+ID4gLSAgICAgaWYgKGYyZnNfaXNfYXRvbWljX2ZpbGUoaW5vZGUp
IHx8IGYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKSkgewo+ID4gKyAgICAgaWYgKGYyZnNfaXNf
YXRvbWljX2ZpbGUoaW5vZGUpIHx8IGYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKSB8fAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgIHJhbmdlLnN0YXJ0ID49IGlub2RlLT5pX3NpemUpIHsKPiA+
ICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiA+ICAgICAgICAgICAgICAgZ290byBlcnI7
Cj4gPiAgICAgICB9Cj4gPgo+ID4gLSAgICAgaWYgKHJhbmdlLnN0YXJ0ID49IGlub2RlLT5pX3Np
emUpIHsKPiA+IC0gICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiA+ICsgICAgIGlmIChyYW5n
ZS5sZW4gPT0gMCkKPiA+ICAgICAgICAgICAgICAgZ290byBlcnI7Cj4gPiAtICAgICB9Cj4gPgo+
ID4gLSAgICAgaWYgKGlub2RlLT5pX3NpemUgLSByYW5nZS5zdGFydCA8IHJhbmdlLmxlbikgewo+
ID4gLSAgICAgICAgICAgICByZXQgPSAtRTJCSUc7Cj4gPiAtICAgICAgICAgICAgIGdvdG8gZXJy
Owo+ID4gLSAgICAgfQo+ID4gLSAgICAgZW5kX2FkZHIgPSByYW5nZS5zdGFydCArIHJhbmdlLmxl
bjsKPiA+ICsgICAgIGlmIChyYW5nZS5sZW4gPT0gKHU2NCktMSB8fCBpbm9kZS0+aV9zaXplIC0g
cmFuZ2Uuc3RhcnQgPCByYW5nZS5sZW4pCj4gPiArICAgICAgICAgICAgIGVuZF9hZGRyID0gaW5v
ZGUtPmlfc2l6ZTsKPgo+IEhtbSwgd2hhdCBpZiB0aGVyZSBhcmUgYmxvY2tzIGJleW9uZCBpX3Np
emU/IERvIHdlIG5lZWQgdG8gY2hlY2sgaV9ibG9ja3MgZm9yCj4gZW5kaW5nIGNyaXRlcmlhPwo+
Cj4gPiArICAgICBlbHNlCj4gPiArICAgICAgICAgICAgIGVuZF9hZGRyID0gcmFuZ2Uuc3RhcnQg
KyByYW5nZS5sZW47Cj4gPgo+ID4gICAgICAgdG9fZW5kID0gKGVuZF9hZGRyID09IGlub2RlLT5p
X3NpemUpOwo+ID4gICAgICAgaWYgKCFJU19BTElHTkVEKHJhbmdlLnN0YXJ0LCBGMkZTX0JMS1NJ
WkUpIHx8Cj4gPiAtLQo+ID4gMi4yNy4wLjM4My5nMDUwMzE5YzJhZS1nb29nCj4gPgo+ID4KPiA+
Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4g
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cj4gPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
