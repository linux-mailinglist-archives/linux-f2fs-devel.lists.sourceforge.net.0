Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA29220579
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jul 2020 08:55:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jvbJg-0004NS-S0; Wed, 15 Jul 2020 06:54:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jvbJg-0004NL-3u
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 06:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NTsvJyRsXTYCu8MRJ6uonhEhc3O9bi7P+xqu5XwBB5o=; b=SXnBbNgdDVqpHXU5kFm/0CMZ4g
 KQkr9aS2JHNb4tMvwKEJ3O0XYJ+/4tSKCqPyp5dnaF93LKfaNxEvfUnKKwcaxaGj9MxN3I7xgViaM
 RGSNZwlptBrMq9UhLphYs6PrN6fz0XufoAVIRK61WZLGoQ43DmneVUwTFIvCPPoybIhk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NTsvJyRsXTYCu8MRJ6uonhEhc3O9bi7P+xqu5XwBB5o=; b=aMJKo3r/UfB8m7SUE4nMVaiuSd
 kKAVhsVNAusvd/wY6R/d18wSySVJ8sDAyI30deUKQKw1QBtH3IexT3Gq80F0p8FYObBNAV5CZ2LU5
 7+/Cf9siplOnCHcST4yUGuOpv6CI8fnHw3T5H7/ueHNE609O0wHRQiij4jM/oZ5Ep99I=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jvbJe-004921-EC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 06:54:56 +0000
Received: by mail-lf1-f65.google.com with SMTP id j21so467625lfe.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Jul 2020 23:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NTsvJyRsXTYCu8MRJ6uonhEhc3O9bi7P+xqu5XwBB5o=;
 b=E6jlNw7evD92OdJk5WvRgw585l+yKXMvWaIDL63GiT3/WAMzPN4eE8SboE4p7Epj14
 sU6PAnG4/7Ye8TdkAcT58Wjx7FS7ictIISKa5aLBRAjORMP62xOGyWrXsCLBGQ8DtcBp
 V/DtM5Pzze4tWl3X/xsum3CWLm/ci6wglbrTQ/ri8l+qinRrGLxIokZfPwNy5PlcdcCV
 mNHZjzSBPa7YLjoGeYFRBBGwJrdMmVNdn46m8fKLwuE4qpenUY+5LBh8ytrmpjffFsDx
 8dvJtaI4bSFxL1AOSgGpPbV2/eeq3pD99oBRkkpXHT3SdfYAM2ljbZE9XzgDa7gWhDXG
 dsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NTsvJyRsXTYCu8MRJ6uonhEhc3O9bi7P+xqu5XwBB5o=;
 b=Z1jNiCqRaFsZBU6+q/d1FDEaKzeTzcF1KiTlckykwM0g8D9/RrlTAKg9NtqOahXP80
 LRF+JwmKRSB6E4iO5BsgbVoJtdj69EZy0WHWty0GawDDT8VP5QvnMYlrgzYzs0OcoC6/
 Dk43ia8u3W0EJw9XQpwUE3iGoScbgKyPHOCO52ZwB0yC6pfGSUfDO1al2pX64dTR0CWM
 AVc6CsEXb/xplsJWmCFkN10x4gjYtnjQJuZGpwRH1kg44cDlFFJiVNHRM3dDgxiGK68G
 T7H/6ZuRgnCIsr7rJITnpuVitN/LcT5O2DwvT4X8fmCOgaQ/8k/UZWPQVAuKLsePWQV9
 OHPQ==
X-Gm-Message-State: AOAM532icfm+3ps8CV15A2Q2ADU5gx+xHNUrmESLxMBOefw67XrgTUdd
 Nqf409GZ9/RfS9cZaLrn9KpfOjA+X140scZA2f8=
X-Google-Smtp-Source: ABdhPJzaAHirbaV9fE8Gp2p6pOT7v1RRsHPmFc3Dtky4E27NDk/KuiefzTdq7jt3y2ung8PHx/RdWli1iHEKYukdpaE=
X-Received: by 2002:a19:e61a:: with SMTP id d26mr4021628lfh.96.1594796087665; 
 Tue, 14 Jul 2020 23:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200713031252.3873546-1-daeho43@gmail.com>
 <20200713181152.GC2910046@google.com>
 <3b02263d-a5e1-136c-40ed-514d34e4c895@huawei.com>
 <CACOAw_wBD_ourGJSdRTDM-wzeH97aGE966QDB6bpjiyXRrh47A@mail.gmail.com>
 <f4a594a1-464f-3a74-90cb-fd536bed9962@huawei.com>
In-Reply-To: <f4a594a1-464f-3a74-90cb-fd536bed9962@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 15 Jul 2020 15:54:36 +0900
Message-ID: <CACOAw_w3OWDVXSYHuTEEVv1HaBZir1CWcRAmxOt00MB4vXBKVg@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jvbJe-004921-EC
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: change the way of handling
 range.len in F2FS_IOC_SEC_TRIM_FILE
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, Daeho Jeong <daehojeong@google.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

WW91IG1lYW4gd2UgY2FuIHN1cHBvcnQgWkVST09VVCBvcHRpb24gb25seSBmb3IgZW5jcnlwdGVk
IGZpbGVzIG9mCm5vbi1tdWx0aWRldmljZSBmMmZzLAphbmQgcmV0dXJuIC1FT1BOT1RTVVBQIGlu
IHRoZSBtdWx0aWRldmljZSBjYXNlLCByaWdodCBub3c/CgoyMDIw64WEIDfsm5QgMTXsnbwgKOyI
mCkg7Jik7ZuEIDM6MTcsIENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT7ri5jsnbQg7J6R7ISx
Ogo+Cj4gT24gMjAyMC83LzE1IDEyOjA2LCBEYWVobyBKZW9uZyB3cm90ZToKPiA+IFdlIGNvdWxk
IHVzZSBmc2NyeXB0X3plcm9vdXRfcmFuZ2UoKSBmb3IgYW4gZW5jcnlwdGVkIGZpbGUuCj4gPiBC
dXQsIG9uZSBwcm9ibGVtIGlzIGZzY3J5cHRfemVyb291dF9yYW5nZSgpIGFzc3VtZXMgdGhhdCBm
aWxlc3lzdGVtcwo+ID4gb25seSB1c2UgYSBzaW5nbGUgYmxvY2sgZGV2aWNlLgo+ID4gSXQgbWVh
bnMgaXQgZG9lc24ndCByZWNlaXZlIGJkZXYgYXMgYSBwYXJhbWV0ZXIuCj4gPiBIb3cgYWJvdXQg
Y2hhbmdpbmcgdGhlIGludGVyZmFjZSBvZiBmc2NyeXB0X3plcm9vdXRfcmFuZ2UoKSBmaXJzdCBh
bmQgdXNpbmcgaXQ/Cj4KPiBZZXMsIHBsZWFzZSBsaW1pdGVkIHRvIHVzZSBmc2NyeXB0X3plcm9v
dXRfcmFuZ2UoKSBvbiBub24tbXVsdGlkZXZpY2UgZjJmcyBpbWFnZQo+IGZpcnN0LCB3ZSBjYW4g
YWRkIGEgY29uZGl0aW9uIHRvIGNoZWNrIHRoYXQgaW4gdGhlIGJlZ2lubmluZyBvZiBpb2N0bCBp
bnRlcmZhY2UsCj4gb25jZSBmc2NyeXB0X3plcm9vdXRfcmFuZ2UoKSBhY2NlcHRzIGJkZXYgYXMg
cGFyYW1ldGVyLCB3ZSBjYW4gcmVtb3ZlIHRoYXQgbGltaXRhdGlvbi4KPgo+IFRoYW5rcywKPgo+
ID4KPiA+IDIwMjDrhYQgN+yblCAxNOydvCAo7ZmUKSDsmKTtm4QgOTozNiwgQ2hhbyBZdSA8eXVj
aGFvMEBodWF3ZWkuY29tPuuLmOydtCDsnpHshLE6Cj4gPj4KPiA+PiBPbiAyMDIwLzcvMTQgMjox
MSwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gPj4+IEhpIERhZWhvLAo+ID4+Pgo+ID4+PiBQbGVhc2Ug
dGFrZSBhIGxvb2sgYXQgdGhpcy4KPiA+Pj4KPiA+Pj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvamFlZ2V1ay9mMmZzLmdpdC9jb21taXQvP2g9ZGV2Jmlk
PTM1MjQ1MTgwNDU5YWViZjZkNzBmZGU4OGE1MzhmMDQwMGE3OTRhYTYKPiA+Pgo+ID4+IEknbSBj
dXJpb3VzIGFib3V0IHdoYXQgd2lsbCBoYXBwZW4gaWYgd2UgY2FsbAo+ID4+IHNlY190cmltX2Zp
bGUoRjJGU19UUklNX0ZJTEVfWkVST09VVCkgb24gYW4gZW5jcnlwdGVkIGZpbGUsIHdpbGwKPiA+
PiBpdCB1c2UgemVybyBiaXRzIGNvdmVyaW5nIGVuY3J5cHRlZCBkYXRhIG9uIGRpc2s/Cj4gPj4K
PiA+PiBUaGFua3MsCj4gPj4KPiA+Pj4KPiA+Pj4gVGhhbmtzLAo+ID4+Pgo+ID4+PiBPbiAwNy8x
MywgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPj4+PiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9u
Z0Bnb29nbGUuY29tPgo+ID4+Pj4KPiA+Pj4+IENoYW5nZWQgdGhlIHdheSBvZiBoYW5kbGluZyBy
YW5nZS5sZW4gb2YgRjJGU19JT0NfU0VDX1RSSU1fRklMRS4KPiA+Pj4+ICAxLiBBZGRlZCAtMSB2
YWx1ZSBzdXBwb3J0IGZvciByYW5nZS5sZW4gdG8gc2VjdXJlIHRyaW0gdGhlIHdob2xlIGJsb2Nr
cwo+ID4+Pj4gICAgIHN0YXJ0aW5nIGZyb20gcmFuZ2Uuc3RhcnQgcmVnYXJkbGVzcyBvZiBpX3Np
emUuCj4gPj4+PiAgMi4gSWYgdGhlIGVuZCBvZiB0aGUgcmFuZ2UgcGFzc2VzIG92ZXIgdGhlIGVu
ZCBvZiBmaWxlLCBpdCBtZWFucyB1bnRpbAo+ID4+Pj4gICAgIHRoZSBlbmQgb2YgZmlsZSAoaV9z
aXplKS4KPiA+Pj4+ICAzLiBpZ25vcmVkIHRoZSBjYXNlIG9mIHRoYXQgcmFuZ2UubGVuIGlzIHpl
cm8gdG8gcHJldmVudCB0aGUgZnVuY3Rpb24KPiA+Pj4+ICAgICBmcm9tIG1ha2luZyBlbmRfYWRk
ciB6ZXJvIGFuZCB0cmlnZ2VyaW5nIGRpZmZlcmVudCBiZWhhdmlvdXIgb2YKPiA+Pj4+ICAgICB0
aGUgZnVuY3Rpb24uCj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogRGFlaG8gSmVvbmcgPGRh
ZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+Pj4+IC0tLQo+ID4+Pj4gQ2hhbmdlcyBpbiB2MjoKPiA+
Pj4+ICAtIENoYW5nZWQgLTEgcmFuZ2UubGVuIG9wdGlvbiB0byBtZWFuIHRoZSB3aG9sZSBibG9j
a3Mgc3RhcnRpbmcgZnJvbQo+ID4+Pj4gICAgcmFuZ2Uuc3RhcnQgcmVnYXJkbGVzcyBvZiBpX3Np
emUKPiA+Pj4+IC0tLQo+ID4+Pj4gIGZzL2YyZnMvZmlsZS5jIHwgMjMgKysrKysrKysrKysrLS0t
LS0tLS0tLS0KPiA+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCj4gPj4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMv
ZjJmcy9maWxlLmMKPiA+Pj4+IGluZGV4IDM2OGM4MGY4ZTJhMS4uMjQ4NTg0MWUzYjJkIDEwMDY0
NAo+ID4+Pj4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPiA+Pj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5j
Cj4gPj4+PiBAQCAtMzc5Miw3ICszNzkyLDcgQEAgc3RhdGljIGludCBmMmZzX3NlY190cmltX2Zp
bGUoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYXJnKQo+ID4+Pj4gICAgICBwZ29m
Zl90IGluZGV4LCBwZ19lbmQ7Cj4gPj4+PiAgICAgIGJsb2NrX3QgcHJldl9ibG9jayA9IDAsIGxl
biA9IDA7Cj4gPj4+PiAgICAgIGxvZmZfdCBlbmRfYWRkcjsKPiA+Pj4+IC0gICAgYm9vbCB0b19l
bmQ7Cj4gPj4+PiArICAgIGJvb2wgdG9fZW5kID0gZmFsc2U7Cj4gPj4+PiAgICAgIGludCByZXQg
PSAwOwo+ID4+Pj4KPiA+Pj4+ICAgICAgaWYgKCEoZmlscC0+Zl9tb2RlICYgRk1PREVfV1JJVEUp
KQo+ID4+Pj4gQEAgLTM4MTMsMjMgKzM4MTMsMjMgQEAgc3RhdGljIGludCBmMmZzX3NlY190cmlt
X2ZpbGUoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYXJnKQo+ID4+Pj4gICAgICBm
aWxlX3N0YXJ0X3dyaXRlKGZpbHApOwo+ID4+Pj4gICAgICBpbm9kZV9sb2NrKGlub2RlKTsKPiA+
Pj4+Cj4gPj4+PiAtICAgIGlmIChmMmZzX2lzX2F0b21pY19maWxlKGlub2RlKSB8fCBmMmZzX2Nv
bXByZXNzZWRfZmlsZShpbm9kZSkpIHsKPiA+Pj4+ICsgICAgaWYgKGYyZnNfaXNfYXRvbWljX2Zp
bGUoaW5vZGUpIHx8IGYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKSB8fAo+ID4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgcmFuZ2Uuc3RhcnQgPj0gaW5vZGUtPmlfc2l6ZSkgewo+ID4+Pj4gICAg
ICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gPj4+PiAgICAgICAgICAgICAgZ290byBlcnI7Cj4g
Pj4+PiAgICAgIH0KPiA+Pj4+Cj4gPj4+PiAtICAgIGlmIChyYW5nZS5zdGFydCA+PSBpbm9kZS0+
aV9zaXplKSB7Cj4gPj4+PiAtICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiA+Pj4+ICsgICAg
aWYgKHJhbmdlLmxlbiA9PSAwKQo+ID4+Pj4gICAgICAgICAgICAgIGdvdG8gZXJyOwo+ID4+Pj4g
LSAgICB9Cj4gPj4+Pgo+ID4+Pj4gLSAgICBpZiAoaW5vZGUtPmlfc2l6ZSAtIHJhbmdlLnN0YXJ0
IDwgcmFuZ2UubGVuKSB7Cj4gPj4+PiAtICAgICAgICAgICAgcmV0ID0gLUUyQklHOwo+ID4+Pj4g
LSAgICAgICAgICAgIGdvdG8gZXJyOwo+ID4+Pj4gKyAgICBpZiAoaW5vZGUtPmlfc2l6ZSAtIHJh
bmdlLnN0YXJ0ID4gcmFuZ2UubGVuKSB7Cj4gPj4+PiArICAgICAgICAgICAgZW5kX2FkZHIgPSBy
YW5nZS5zdGFydCArIHJhbmdlLmxlbjsKPiA+Pj4+ICsgICAgfSBlbHNlIHsKPiA+Pj4+ICsgICAg
ICAgICAgICBlbmRfYWRkciA9IHJhbmdlLmxlbiA9PSAodTY0KS0xID8KPiA+Pj4+ICsgICAgICAg
ICAgICAgICAgICAgIHNiaS0+c2ItPnNfbWF4Ynl0ZXMgOiBpbm9kZS0+aV9zaXplOwo+ID4+Pj4g
KyAgICAgICAgICAgIHRvX2VuZCA9IHRydWU7Cj4gPj4+PiAgICAgIH0KPiA+Pj4+IC0gICAgZW5k
X2FkZHIgPSByYW5nZS5zdGFydCArIHJhbmdlLmxlbjsKPiA+Pj4+Cj4gPj4+PiAtICAgIHRvX2Vu
ZCA9IChlbmRfYWRkciA9PSBpbm9kZS0+aV9zaXplKTsKPiA+Pj4+ICAgICAgaWYgKCFJU19BTElH
TkVEKHJhbmdlLnN0YXJ0LCBGMkZTX0JMS1NJWkUpIHx8Cj4gPj4+PiAgICAgICAgICAgICAgICAg
ICAgICAoIXRvX2VuZCAmJiAhSVNfQUxJR05FRChlbmRfYWRkciwgRjJGU19CTEtTSVpFKSkpIHsK
PiA+Pj4+ICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOwo+ID4+Pj4gQEAgLTM4NDYsNyArMzg0
Niw4IEBAIHN0YXRpYyBpbnQgZjJmc19zZWNfdHJpbV9maWxlKHN0cnVjdCBmaWxlICpmaWxwLCB1
bnNpZ25lZCBsb25nIGFyZykKPiA+Pj4+ICAgICAgZG93bl93cml0ZSgmRjJGU19JKGlub2RlKS0+
aV9nY19yd3NlbVtXUklURV0pOwo+ID4+Pj4gICAgICBkb3duX3dyaXRlKCZGMkZTX0koaW5vZGUp
LT5pX21tYXBfc2VtKTsKPiA+Pj4+Cj4gPj4+PiAtICAgIHJldCA9IGZpbGVtYXBfd3JpdGVfYW5k
X3dhaXRfcmFuZ2UobWFwcGluZywgcmFuZ2Uuc3RhcnQsIGVuZF9hZGRyIC0gMSk7Cj4gPj4+PiAr
ICAgIHJldCA9IGZpbGVtYXBfd3JpdGVfYW5kX3dhaXRfcmFuZ2UobWFwcGluZywgcmFuZ2Uuc3Rh
cnQsCj4gPj4+PiArICAgICAgICAgICAgICAgICAgICB0b19lbmQgPyBMTE9OR19NQVggOiBlbmRf
YWRkciAtIDEpOwo+ID4+Pj4gICAgICBpZiAocmV0KQo+ID4+Pj4gICAgICAgICAgICAgIGdvdG8g
b3V0Owo+ID4+Pj4KPiA+Pj4+IC0tCj4gPj4+PiAyLjI3LjAuMzgzLmcwNTAzMTljMmFlLWdvb2cK
PiA+Pj4KPiA+Pj4KPiA+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiA+Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+Pj4gTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+Pj4gaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+ID4+PiAuCj4gPj4+
Cj4gPiAuCj4gPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
