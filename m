Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C55649422
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Dec 2022 13:09:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4L8c-0004Am-1s;
	Sun, 11 Dec 2022 12:08:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ssawgyw@gmail.com>) id 1p4L8V-0004Aa-8B
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 12:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9WrHr/ARwnMyppm++yunzPxOr+kEprrwqMrIKFv+XIU=; b=NtauvvvOt8sCzGV1k4PGeWu9OF
 o539Y45nfx2P5C37IJ4oxAe3PAzTcDGZzuYEhH7SZ93R04kRte5LrywCYYqZMOx+ziRFvahVnhltj
 C2DPA318agYQ+qHZ4V7vwaze5Hn1uuSUa1JamExQ0jiteEND/EMYGKTQeOwVq7TqbJE4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9WrHr/ARwnMyppm++yunzPxOr+kEprrwqMrIKFv+XIU=; b=HnKuXl78Zbple2Caa4R2IvXqDX
 yX9YLCWDQCooFOKsIEXlm7O6qjq+zfFEUNWca0KMOMYuipDcIoE4FvMdwt6MmL+5P+B6Y3qHcIUa0
 6f5X9YfjToCAGxRBg7kwV/rFIP7Ly91k3UsmcQgiK0s0zJdygTjRFIY3IUHW6jYXbyb8=;
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p4L8T-0005uY-BL for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 12:08:51 +0000
Received: by mail-pj1-f54.google.com with SMTP id js9so8233779pjb.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 11 Dec 2022 04:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9WrHr/ARwnMyppm++yunzPxOr+kEprrwqMrIKFv+XIU=;
 b=NKtFvqzh0GHJdhTuyl8EatAHdryR01F6HQEMJNRDaDOuxCepmMGCLP72sSFp9gVMM7
 gygK2XTYA6YB9wdjJuJhKyrDCGd8+E2bvYP1+E5i6tnzpRvzVoNTesbIEU0IxQuQNtBd
 cXL3gmU9k9vplNNnWoDlULalhfziN+Me0plYqafFdeV71B3y7/xKu0DcJMcjlA2qfNju
 GEIN1h276n1tvlqmS4WDUa1MiJytO3gvN+P/9T/6vpPGEIaMojt3KnVmLA8htg9QN/uC
 CLDvzl0LClM3jOFa/Y+F+9pNIY64/zAL2nXzOp3cRkze1ifE27FpgFtwUIx11/k8iJ1v
 bRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9WrHr/ARwnMyppm++yunzPxOr+kEprrwqMrIKFv+XIU=;
 b=n23mrDlOKvS2X/TbT8z3CR9Pwql+Coq4dPJCiFapeuzxHVWkc4XFVaE+gMg1A8JDjQ
 dXm0FOFnM33WwHn1+IFdPhru0fWthRtwkcPyBsss1u2eYTiPkIXs3Yz6wz8XIyTHt+eO
 v1AIU6t+iOZ24mn8QSV9gnlsSEuRTxmzTV4oE+HH5dqzPgwujOTGpGpW4CWvvvi3/RJP
 LXBBe/vvNCrCO1a5xwVnTDSEIjC7wDCwwA/Mkb0rLKTXiIbesWH2VakTfns/SnN7Ktcm
 aiSh1cB+Dg4SeWlT+7QJ4LwHpQqJ7qXAh8C++2ydf2P9ONo0iYLY8253U/T7vIXS9KKq
 uglQ==
X-Gm-Message-State: ANoB5pkT2F/5dyZCwM9pbpsMmLBpSbKgm+UFIkA+VZnIjID45l2KytgD
 jpFpzdRmd5uylmILxSPvRJ4=
X-Google-Smtp-Source: AA0mqf6I8yxImjueeWCqD2/eos0s/WkdQT7MJbHro4tD1yZF6qlRgRjP54rcihxZSpmZms4el5rxgQ==
X-Received: by 2002:a05:6a21:3398:b0:a4:bd66:6201 with SMTP id
 yy24-20020a056a21339800b000a4bd666201mr19735663pzb.59.1670760523767; 
 Sun, 11 Dec 2022 04:08:43 -0800 (PST)
Received: from [127.0.0.1] (ec2-18-162-209-88.ap-east-1.compute.amazonaws.com.
 [18.162.209.88]) by smtp.gmail.com with ESMTPSA id
 a21-20020aa794b5000000b00574b86040a4sm3956601pfl.3.2022.12.11.04.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 04:08:43 -0800 (PST)
Message-ID: <547e58b1-942e-8beb-29a2-3920184c46a0@gmail.com>
Date: Sun, 11 Dec 2022 20:08:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20221121161101.72847-1-Yuwei.Guan@zeekrlife.com>
 <7368c57a-141e-86b0-365f-8af795940483@kernel.org>
From: Yuwei Guan <ssawgyw@gmail.com>
In-Reply-To: <7368c57a-141e-86b0-365f-8af795940483@kernel.org>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2022/12/11 10:36, Chao Yu 写道: > On 2022/11/22 0:11,
    Yuwei Guan wrote: >> As the 'dcc->discard_granularity' and 'dcc->max_ordered_discard'
    can >> be set >> at the user space, and if the 'dcc->m [...] 
 
 Content analysis details:   (-2.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [ssawgyw[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.216.54 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.216.54 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1p4L8T-0005uY-BL
Subject: Re: [f2fs-dev] [PATCH] f2fs: continuous counting for 'issued' in
 __issue_discard_cmd_orderly()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyMi8xMi8xMSAxMDozNiwgQ2hhbyBZdSDlhpnpgZM6Cj4gT24gMjAyMi8xMS8yMiAw
OjExLCBZdXdlaSBHdWFuIHdyb3RlOgo+PiBBcyB0aGUgJ2RjYy0+ZGlzY2FyZF9ncmFudWxhcml0
eScgYW5kICdkY2MtPm1heF9vcmRlcmVkX2Rpc2NhcmQnIGNhbiAKPj4gYmUgc2V0Cj4+IGF0IHRo
ZSB1c2VyIHNwYWNlLCBhbmQgaWYgdGhlICdkY2MtPm1heF9vcmRlcmVkX2Rpc2NhcmQnIGlzIHNl
dCBsYXJnZXIgCj4+IHRoYW4KPj4gJ2RjYy0+ZGlzY2FyZF9ncmFudWxhcml0eScgaW4gRFBPTElD
WV9CRyBtb2RlLCBvciBpdCdzIGEgdm9sdW1lIGRldmljZSwKPj4gZGlzY2FyZF9ncmFudWxhcml0
eSBjYW4gYmUgdHVuZWQgdG8gMSBpbiBmMmZzX3R1bmluZ19wYXJhbWV0ZXJzKCksCj4+IGl0IHdp
bGwgbWF5IHNlbmQgbW9yZSByZXF1ZXN0cyB0aGFuIHRoZSBudW1iZXIgb2YgJ2Rwb2xpY3ktPm1h
eF9yZXF1ZXN0cycKPj4gaW4gaXNzdWVfZGlzY2FyZF90aHJlYWQoKS4KPj4KPj4gVGhpcyBwYXRj
aCB3aWxsIGZpeCB0aGUgaXNzdWUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFl1d2VpIEd1YW4gPFl1
d2VpLkd1YW5AemVla3JsaWZlLmNvbT4KPj4gLS0tCj4+IMKgIGZzL2YyZnMvc2VnbWVudC5jIHwg
MTcgKysrKysrKystLS0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIv
ZnMvZjJmcy9zZWdtZW50LmMKPj4gaW5kZXggOGIwYjc2NTUwNTc4Li5iMDE1N2JmMzkyZmIgMTAw
NjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jCj4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5j
Cj4+IEBAIC0xMzc5LDggKzEzNzksOCBAQCBzdGF0aWMgaW50IF9fcXVldWVfZGlzY2FyZF9jbWQo
c3RydWN0IAo+PiBmMmZzX3NiX2luZm8gKnNiaSwKPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4g
wqAgfQo+PiAtc3RhdGljIHVuc2lnbmVkIGludCBfX2lzc3VlX2Rpc2NhcmRfY21kX29yZGVybHko
c3RydWN0IGYyZnNfc2JfaW5mbyAKPj4gKnNiaSwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkaXNjYXJkX3BvbGljeSAqZHBvbGljeSkKPj4gK3N0YXRp
YyBpbnQgX19pc3N1ZV9kaXNjYXJkX2NtZF9vcmRlcmx5KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkaXNj
YXJkX3BvbGljeSAqZHBvbGljeSwgaW50ICppc3N1ZWQpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBz
dHJ1Y3QgZGlzY2FyZF9jbWRfY29udHJvbCAqZGNjID0gU01fSShzYmkpLT5kY2NfaW5mbzsKPj4g
wqDCoMKgwqDCoCBzdHJ1Y3QgZGlzY2FyZF9jbWQgKnByZXZfZGMgPSBOVUxMLCAqbmV4dF9kYyA9
IE5VTEw7Cj4+IEBAIC0xMzg4LDcgKzEzODgsNiBAQCBzdGF0aWMgdW5zaWduZWQgaW50IAo+PiBf
X2lzc3VlX2Rpc2NhcmRfY21kX29yZGVybHkoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+PiDC
oMKgwqDCoMKgIHN0cnVjdCBkaXNjYXJkX2NtZCAqZGM7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGJs
a19wbHVnIHBsdWc7Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IHBvcyA9IGRjYy0+bmV4dF9w
b3M7Cj4+IC3CoMKgwqAgdW5zaWduZWQgaW50IGlzc3VlZCA9IDA7Cj4+IMKgwqDCoMKgwqAgYm9v
bCBpb19pbnRlcnJ1cHRlZCA9IGZhbHNlOwo+PiDCoMKgwqDCoMKgIG11dGV4X2xvY2soJmRjYy0+
Y21kX2xvY2spOwo+PiBAQCAtMTQxNSw5ICsxNDE0LDkgQEAgc3RhdGljIHVuc2lnbmVkIGludCAK
Pj4gX19pc3N1ZV9kaXNjYXJkX2NtZF9vcmRlcmx5KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRjYy0+bmV4dF9w
b3MgPSBkYy0+bHN0YXJ0ICsgZGMtPmxlbjsKPj4gLcKgwqDCoMKgwqDCoMKgIGVyciA9IF9fc3Vi
bWl0X2Rpc2NhcmRfY21kKHNiaSwgZHBvbGljeSwgZGMsICZpc3N1ZWQpOwo+PiArwqDCoMKgwqDC
oMKgwqAgZXJyID0gX19zdWJtaXRfZGlzY2FyZF9jbWQoc2JpLCBkcG9saWN5LCBkYywgaXNzdWVk
KTsKPj4gLcKgwqDCoMKgwqDCoMKgIGlmIChpc3N1ZWQgPj0gZHBvbGljeS0+bWF4X3JlcXVlc3Rz
KQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCppc3N1ZWQgPj0gZHBvbGljeS0+bWF4X3JlcXVlc3Rz
KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gwqAgbmV4dDoKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIG5vZGUgPSByYl9uZXh0KCZkYy0+cmJfbm9kZSk7Cj4+IEBAIC0xNDMz
LDEwICsxNDMyLDEwIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgCj4+IF9faXNzdWVfZGlzY2FyZF9j
bWRfb3JkZXJseShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+IMKgwqDCoMKgwqAgbXV0ZXhf
dW5sb2NrKCZkY2MtPmNtZF9sb2NrKTsKPj4gLcKgwqDCoCBpZiAoIWlzc3VlZCAmJiBpb19pbnRl
cnJ1cHRlZCkKPj4gLcKgwqDCoMKgwqDCoMKgIGlzc3VlZCA9IC0xOwo+PiArwqDCoMKgIGlmICgh
KCppc3N1ZWQpICYmIGlvX2ludGVycnVwdGVkKQo+PiArwqDCoMKgwqDCoMKgwqAgKmlzc3VlZCA9
IC0xOwo+PiAtwqDCoMKgIHJldHVybiBpc3N1ZWQ7Cj4+ICvCoMKgwqAgcmV0dXJuICppc3N1ZWQ7
Cj4gCj4gQSBsaXR0bGUgd2VpcmVkIHRoYXQgX19pc3N1ZV9kaXNjYXJkX2NtZF9vcmRlcmx5KCkg
d2lsbCBvdXRwdXQgdGhlIGRhdGEKPiBpbiBib3RoIHJldHVybiB2YWx1ZSBhbmQgQGlzc3VlZCBw
YXJhbWV0ZXIuCj4gCkdvdCBpdC4KPiBIb3cgYWJvdXQgY2hhbmdpbmcgdHlwZSBvZiByZXR1cm4g
dmFsdWUgX19pc3N1ZV9kaXNjYXJkX2NtZF9vcmRlcmx5KCkKPiBmcm9tIHVuc2lnbmVkIGludCB0
byB2b2lkLgo+IApJIHdpbGwgc2VudCBhIHYyIHBhdGNoIGZvciB0aGlzLgo+IFRoYW5rcywKPiAK
Pj4gwqAgfQo+PiDCoCBzdGF0aWMgdW5zaWduZWQgaW50IF9fd2FpdF9hbGxfZGlzY2FyZF9jbWQo
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3RydWN0IGRpc2NhcmRfcG9saWN5ICpkcG9saWN5KTsKPj4gQEAgLTE0
NjUsNyArMTQ2NCw3IEBAIHN0YXRpYyBpbnQgX19pc3N1ZV9kaXNjYXJkX2NtZChzdHJ1Y3QgCj4+
IGYyZnNfc2JfaW5mbyAqc2JpLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChpICsgMSA8IGRjYy0+bWF4X29yZGVyZWRfZGlzY2Fy
ZCAmJiBkcG9saWN5LT5vcmRlcmVkKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
X19pc3N1ZV9kaXNjYXJkX2NtZF9vcmRlcmx5KHNiaSwgZHBvbGljeSk7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiBfX2lzc3VlX2Rpc2NhcmRfY21kX29yZGVybHkoc2JpLCBkcG9s
aWN5LCAmaXNzdWVkKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHBlbmRfbGlzdCA9ICZkY2MtPnBl
bmRfbGlzdFtpXTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
