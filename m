Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mApCIFDb7WnIoAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 26 Apr 2026 11:30:56 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFF046949F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 26 Apr 2026 11:30:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6O6CarHn5Gfj6zr8aA/G4682g+xsgD/x3QPmxinYVd0=; b=IrFoOQbtDCr/EKXWGG/3hc2RH/
	dtot0Bir4+7idSkV1sJCudO/gPqaat4ICMa4jaPIK1Qdsj3DLswCZRGj7bYCPSiK/a2aSKXYNT8HD
	lb0o7kpYvMYLntJSDETqoheV6sTuhkwoYhh11SxlqSiG45mRpruy3vNDM1z1Fbig8vlc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wGvp5-0007cq-MH;
	Sun, 26 Apr 2026 09:30:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ruipengqi3@gmail.com>) id 1wGvot-0007cK-OV
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 26 Apr 2026 09:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ngldw17zqa0g84KPPJcvySA7+Z+hTyy5mHYtGRbcHBw=; b=WcwQ9Ryxh5d45oPMKyPfnqAgz3
 PaWkV0pj5vrOTYev8umxHIs00q5GHIAVSPXAqNoipRHfpdPBbxw7VtVLqno0yC/k0QhILwwqrv+Rx
 7Qdbg7Hbdn2fpIOigfA97HzOOn2SNHBQpvpBoGY3pqpC4oDVYJSnNYCARQ8+YOMHSy3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ngldw17zqa0g84KPPJcvySA7+Z+hTyy5mHYtGRbcHBw=; b=MeJcNnD9WQb06oQWg+Ynx81/DO
 adhtRaAKlUoZYrgbmk+BwrhMsI8e2l5f+Os9mU1bNhp0H4vsopWLQP6ZGLR/3cmhCMUmJ2H7uJ+fK
 ZpAkHeASIzUuUQgYHo/7DLPXPW0nMSJqMvY/a8JJzyZys4L5sbRLdN2ZEMAJOjHpicwk=;
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wGvoq-0000z2-2z for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 26 Apr 2026 09:30:29 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-362e50b4641so1561550a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 26 Apr 2026 02:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777195822; x=1777800622; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ngldw17zqa0g84KPPJcvySA7+Z+hTyy5mHYtGRbcHBw=;
 b=lSW1b1+lUMBk98kQZW9+qpftrUI+C8j45JUoMLaUx5oe2wBpWR45D63x9Y440X4dGs
 kBBSrIqP6ypJgIsyxbPwEcE+Dl9kUaweEu7rUSxBwkM/4TrYmyEAVyB9Kwjxp/pZzkeI
 vHalmtqvggBMULLwwd3IWzLMArgyJhju90j23L3817OVfSLWJT/arnu6DivBWD2Nt+u4
 24Ny2kiKPE3i+AVk1PZLISUhMbfJDJQZnjj1WkrUmaz4OU0mrOVQ6T5AZYTjpBIb1x4F
 S1T2nD9MnmhPvhV5RnyKFg4Gvj6yt9gLldgOf3Hah++KklNDR5O2TnlNu9tejJbdCO65
 NMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777195822; x=1777800622;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ngldw17zqa0g84KPPJcvySA7+Z+hTyy5mHYtGRbcHBw=;
 b=sDfCfDnNiaOMd5cKuZCytv9kjEt6c1endPdva5PepdiSVi4xKo/GKRWmIE6TQoR/JE
 s3pbL/BSJ0O4km7SYjelb9rdFjxGLiK9mOuSEn198mQq739uSZIbmUvYUuQ+/I6Iglbe
 dwvnyLhkRZvX83L0CymHimpAAaAHvYvKHf+b8j8wtFIfyggdygQpIuHmpyYOXnwBkA4f
 Gki+CgT0oHgXWCnAWyEyduSOpPYaHBLe77FZb0u5eQej+9RrU/5KKglEBTBAECtm34hg
 6PtZdXEK9jkFJVhPOJor5EN6KTmMRhZD/KhPCR7DvBpKFx11cit63DDYH8noqzfv+nUI
 vdnQ==
X-Gm-Message-State: AOJu0Yyjj3OPL4uxeswCiuOwAou3GwtMmfH/0F/P4FEhZk3lTJMOYBH0
 cMu2OpAk3hVm9BW0v92hBLWp/KKnOt4o5Jsu93W/xL5/fssuz/bs3wZf
X-Gm-Gg: AeBDietzHrzk/yZt0SeI6y9kmcQuynlquUB3JQ+pgkzLt8cdlyo/9Jn2vR1Ms6fwobN
 FzbOC5V9TLtn9NCFeSDidCsdKwPwJ9WPDwpvgMmLZDMwcJV9qB15NSDPx1/X5Xbc76m6wF4qtHz
 LUnG4I86YtQV7P6jY/EF+3HUyO2096zCefBQEBK7l4QBc+LLGhnbZo44hYEK0Nh2mew72Cweqb1
 R34n9Vok2KMNR25y8gCPYX3lPZe3gZVV9TGKM9HIOlIFp5Rpxl8mlrDa6+l0eOjPZP0ScXozrBR
 6tOQTraIOiRgByDbtRpOMa5PqGqHhjKjd4dguTj0Nbm+TIzNPpEHXxw4uQum2UxAtSAYUQOnj+7
 ZCrigFQcIIAqFil8v2/mHRqthpuQdPdaM9TJyvm1cBbtpfN1iy+3OuFMskfQ+c3XHbVI9fVVEKc
 +qV0wEaPVErDHSqAcjfhyFc7vytpLDAvfRTPxQEPpJBd23zl1D
X-Received: by 2002:a17:90a:102:b0:35f:b940:4e81 with SMTP id
 98e67ed59e1d1-3614046f98emr24975428a91.16.1777195820750; 
 Sun, 26 Apr 2026 02:30:20 -0700 (PDT)
Received: from [10.121.80.58] ([210.184.73.204])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36141868906sm27782558a91.3.2026.04.26.02.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Apr 2026 02:30:20 -0700 (PDT)
Message-ID: <47128c90-86e3-48a6-aa11-3da39218ae7c@gmail.com>
Date: Sun, 26 Apr 2026 17:30:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20260325133749.1053541-1-ruipengqi3@gmail.com>
 <607d2d34-9d58-42d1-8436-e85d9c73eb7a@kernel.org>
Content-Language: en-US
From: Ruipeng Qi <ruipengqi3@gmail.com>
In-Reply-To: <607d2d34-9d58-42d1-8436-e85d9c73eb7a@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/4/20 15:35, Chao Yu wrote: > Hi Ruipeng, > > Sorry, 
 I missed your patch. > > On 3/25/2026 9:37 PM, ruipengqi wrote: >> From:
 Ruipeng Qi >> >> When the f2fs filesystem space is nearly exhaus [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [ruipengqi3(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ruipengqi3(at)gmail.com]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.52 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wGvoq-0000z2-2z
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix potential deadlock in
 f2fs_balance_fs()
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
X-Rspamd-Queue-Id: 6FFF046949F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ruipengqi3@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruipengqi3@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

Ck9uIDIwMjYvNC8yMCAxNTozNSwgQ2hhbyBZdSB3cm90ZToKPiBIaSBSdWlwZW5nLAo+Cj4gU29y
cnksIEkgbWlzc2VkIHlvdXIgcGF0Y2guCj4KPiBPbiAzLzI1LzIwMjYgOTozNyBQTSwgcnVpcGVu
Z3FpIHdyb3RlOgo+PiBGcm9tOiBSdWlwZW5nIFFpIDxydWlwZW5ncWkzQGdtYWlsLmNvbT4KPj4K
Pj4gV2hlbiB0aGUgZjJmcyBmaWxlc3lzdGVtIHNwYWNlIGlzIG5lYXJseSBleGhhdXN0ZWQsIHdl
IGVuY291bnRlciAKPj4gZGVhZGxvY2sKPj4gaXNzdWVzIGFzIGJlbG93Ogo+Pgo+PiBJTkZPOiB0
YXNrIEE6MTg5MCBibG9ja2VkIGZvciBtb3JlIHRoYW4gMTIwIHNlY29uZHMuCj4+IMKgwqDCoMKg
wqDCoCBUYWludGVkOiBHwqDCoMKgwqDCoMKgwqDCoMKgwqAgT8KgwqDCoMKgwqDCoCA2LjEyLjQx
LWczZmUwN2RkZjA1YWIgIzEKPj4gImVjaG8gMCA+IC9wcm9jL3N5cy9rZXJuZWwvaHVuZ190YXNr
X3RpbWVvdXRfc2VjcyIgZGlzYWJsZXMgdGhpcyAKPj4gbWVzc2FnZS4KPj4gdGFzazpBwqDCoMKg
IHN0YXRlOkQgc3RhY2s6MMKgwqDCoMKgIHBpZDoxODkwwqAgdGdpZDoxNjI2wqAgcHBpZDoxMTUz
IAo+PiBmbGFnczoweDAwMDAwMjA0Cj4+IENhbGwgdHJhY2U6Cj4+IMKgIF9fc3dpdGNoX3RvKzB4
ZjQvMHgxNTgKPj4gwqAgX19zY2hlZHVsZSsweDI3Yy8weDkwOAo+PiDCoCBzY2hlZHVsZSsweDNj
LzB4MTE4Cj4+IMKgIGlvX3NjaGVkdWxlKzB4NDQvMHg2OAo+PiDCoCBmb2xpb193YWl0X2JpdF9j
b21tb24rMHgxNzQvMHgzNzAKPj4gwqAgZm9saW9fd2FpdF9iaXQrMHgyMC8weDM4Cj4+IMKgIGZv
bGlvX3dhaXRfd3JpdGViYWNrKzB4NTQvMHhjOAo+PiDCoCB0cnVuY2F0ZV9pbm9kZV9wYXJ0aWFs
X2ZvbGlvKzB4NzAvMHgxZTAKPj4gwqAgdHJ1bmNhdGVfaW5vZGVfcGFnZXNfcmFuZ2UrMHgxYjAv
MHg0NTAKPj4gwqAgdHJ1bmNhdGVfcGFnZWNhY2hlKzB4NTQvMHg4OAo+PiDCoCBmMmZzX2ZpbGVf
d3JpdGVfaXRlcisweDNlOC8weGI4MAo+PiDCoCBkb19pdGVyX3JlYWR2X3dyaXRldisweGYwLzB4
MWUwCj4+IMKgIHZmc193cml0ZXYrMHgxMzgvMHgyYzgKPj4gwqAgZG9fd3JpdGV2KzB4ODgvMHgx
MzAKPj4gwqAgX19hcm02NF9zeXNfd3JpdGV2KzB4MjgvMHg0MAo+PiDCoCBpbnZva2Vfc3lzY2Fs
bCsweDUwLzB4MTIwCj4+IMKgIGVsMF9zdmNfY29tbW9uLmNvbnN0cHJvcC4wKzB4YzgvMHhmMAo+
PiDCoCBkb19lbDBfc3ZjKzB4MjQvMHgzOAo+PiDCoCBlbDBfc3ZjKzB4MzAvMHhmOAo+PiDCoCBl
bDB0XzY0X3N5bmNfaGFuZGxlcisweDEyMC8weDEzMAo+PiDCoCBlbDB0XzY0X3N5bmMrMHgxOTAv
MHgxOTgKPj4KPj4gSU5GTzogdGFzayBrd29ya2VyL3U4OjExOjI2ODA4NTMgYmxvY2tlZCBmb3Ig
bW9yZSB0aGFuIDEyMCBzZWNvbmRzLgo+PiDCoMKgwqDCoMKgwqAgVGFpbnRlZDogR8KgwqDCoMKg
wqDCoMKgwqDCoMKgIE/CoMKgwqDCoMKgwqAgNi4xMi40MS1nM2ZlMDdkZGYwNWFiICMxCj4+ICJl
Y2hvIDAgPiAvcHJvYy9zeXMva2VybmVsL2h1bmdfdGFza190aW1lb3V0X3NlY3MiIGRpc2FibGVz
IHRoaXMgCj4+IG1lc3NhZ2UuCj4+IHRhc2s6a3dvcmtlci91ODoxMcKgwqAgc3RhdGU6RCBzdGFj
azowwqDCoMKgwqAgcGlkOjI2ODA4NTMgdGdpZDoyNjgwODUzIAo+PiBwcGlkOjLCoMKgwqDCoMKg
IGZsYWdzOjB4MDAwMDAyMDgKPj4gV29ya3F1ZXVlOiB3cml0ZWJhY2sgd2Jfd29ya2ZuIChmbHVz
aC0yNTQ6MCkKPj4gQ2FsbCB0cmFjZToKPj4gwqAgX19zd2l0Y2hfdG8rMHhmNC8weDE1OAo+PiDC
oCBfX3NjaGVkdWxlKzB4MjdjLzB4OTA4Cj4+IMKgIHNjaGVkdWxlKzB4M2MvMHgxMTgKPj4gwqAg
aW9fc2NoZWR1bGUrMHg0NC8weDY4Cj4+IMKgIGZvbGlvX3dhaXRfYml0X2NvbW1vbisweDE3NC8w
eDM3MAo+PiDCoCBfX2ZpbGVtYXBfZ2V0X2ZvbGlvKzB4MjE0LzB4MzQ4Cj4+IMKgIHBhZ2VjYWNo
ZV9nZXRfcGFnZSsweDIwLzB4NzAKPj4gwqAgZjJmc19nZXRfcmVhZF9kYXRhX3BhZ2UrMHgxNTAv
MHgzZTgKPj4gwqAgZjJmc19nZXRfbG9ja19kYXRhX3BhZ2UrMHgyYy8weDE2MAo+PiDCoCBtb3Zl
X2RhdGFfcGFnZSsweDUwLzB4NDc4Cj4+IMKgIGRvX2dhcmJhZ2VfY29sbGVjdCsweGQzOC8weDE1
MjgKPj4gwqAgZjJmc19nYysweDI0MC8weDdlMAo+PiDCoCBmMmZzX2JhbGFuY2VfZnMrMHgxYTAv
MHgyMDgKPj4gwqAgZjJmc193cml0ZV9zaW5nbGVfZGF0YV9wYWdlKzB4NmU0LzB4NzMwwqAgLy8w
eGZmZmZmZTBkNmNhMDgzMDAKPj4gwqAgZjJmc193cml0ZV9jYWNoZV9wYWdlcysweDM3OC8weDli
MAo+PiDCoCBmMmZzX3dyaXRlX2RhdGFfcGFnZXMrMHgyZTQvMHgzODgKPj4gwqAgZG9fd3JpdGVw
YWdlcysweDhjLzB4MmM4Cj4+IMKgIF9fd3JpdGViYWNrX3NpbmdsZV9pbm9kZSsweDRjLzB4NDk4
Cj4+IMKgIHdyaXRlYmFja19zYl9pbm9kZXMrMHgyMzQvMHg0YTgKPj4gwqAgX193cml0ZWJhY2tf
aW5vZGVzX3diKzB4NTgvMHgxMTgKPj4gwqAgd2Jfd3JpdGViYWNrKzB4MmY4LzB4M2MwCj4+IMKg
IHdiX3dvcmtmbisweDJjNC8weDUwOAo+PiDCoCBwcm9jZXNzX29uZV93b3JrKzB4MTgwLzB4NDA4
Cj4+IMKgIHdvcmtlcl90aHJlYWQrMHgyNTgvMHgzNjgKPj4gwqAga3RocmVhZCsweDExOC8weDEy
OAo+PiDCoCByZXRfZnJvbV9mb3JrKzB4MTAvMHgyMDAKPj4KPj4gSU5GTzogdGFzayBrd29ya2Vy
L3U4Ojg6MjY0MTI5NyBibG9ja2VkIGZvciBtb3JlIHRoYW4gMTIwIHNlY29uZHMuCj4+IMKgwqDC
oMKgwqDCoCBUYWludGVkOiBHwqDCoMKgwqDCoMKgwqDCoMKgwqAgT8KgwqDCoMKgwqDCoCA2LjEy
LjQxLWczZmUwN2RkZjA1YWIgIzEKPj4gImVjaG8gMCA+IC9wcm9jL3N5cy9rZXJuZWwvaHVuZ190
YXNrX3RpbWVvdXRfc2VjcyIgZGlzYWJsZXMgdGhpcyAKPj4gbWVzc2FnZS4KPj4gdGFzazprd29y
a2VyL3U4OjjCoMKgwqAgc3RhdGU6RCBzdGFjazowwqDCoMKgwqAgcGlkOjI2NDEyOTcgdGdpZDoy
NjQxMjk3IAo+PiBwcGlkOjLCoMKgwqDCoMKgIGZsYWdzOjB4MDAwMDAyMDgKPj4gV29ya3F1ZXVl
OiB3cml0ZWJhY2sgd2Jfd29ya2ZuIChmbHVzaC0yNTQ6MCkKPj4gQ2FsbCB0cmFjZToKPj4gwqAg
X19zd2l0Y2hfdG8rMHhmNC8weDE1OAo+PiDCoCBfX3NjaGVkdWxlKzB4MjdjLzB4OTA4Cj4+IMKg
IHJ0X211dGV4X3NjaGVkdWxlKzB4MzAvMHg2MAo+PiDCoCBfX3J0X211dGV4X3Nsb3dsb2NrX2xv
Y2tlZC5jb25zdHByb3AuMCsweDQ2MC8weDhhOAo+PiDCoCByd2Jhc2Vfd3JpdGVfbG9jaysweDI0
Yy8weDM3OAo+PiDCoCBkb3duX3dyaXRlKzB4MWMvMHgzMAo+PiDCoCBmMmZzX2JhbGFuY2VfZnMr
MHgxODQvMHgyMDgKPj4gwqAgZjJmc193cml0ZV9pbm9kZSsweGY0LzB4MzI4Cj4+IMKgIF9fd3Jp
dGViYWNrX3NpbmdsZV9pbm9kZSsweDM3MC8weDQ5OAo+PiDCoCB3cml0ZWJhY2tfc2JfaW5vZGVz
KzB4MjM0LzB4NGE4Cj4+IMKgIF9fd3JpdGViYWNrX2lub2Rlc193YisweDU4LzB4MTE4Cj4+IMKg
IHdiX3dyaXRlYmFjaysweDJmOC8weDNjMAo+PiDCoCB3Yl93b3JrZm4rMHgyYzQvMHg1MDgKPj4g
wqAgcHJvY2Vzc19vbmVfd29yaysweDE4MC8weDQwOAo+PiDCoCB3b3JrZXJfdGhyZWFkKzB4MjU4
LzB4MzY4Cj4+IMKgIGt0aHJlYWQrMHgxMTgvMHgxMjgKPj4gwqAgcmV0X2Zyb21fZm9yaysweDEw
LzB4MjAKPj4KPj4gSU5GTzogdGFzayBCOjE5MDIgYmxvY2tlZCBmb3IgbW9yZSB0aGFuIDEyMCBz
ZWNvbmRzLgo+PiDCoMKgwqDCoMKgwqAgVGFpbnRlZDogR8KgwqDCoMKgwqDCoMKgwqDCoMKgIE/C
oMKgwqDCoMKgwqAgNi4xMi40MS1nM2ZlMDdkZGYwNWFiICMxCj4+ICJlY2hvIDAgPiAvcHJvYy9z
eXMva2VybmVsL2h1bmdfdGFza190aW1lb3V0X3NlY3MiIGRpc2FibGVzIHRoaXMgCj4+IG1lc3Nh
Z2UuCj4+IHRhc2s6QsKgwqDCoMKgIHN0YXRlOkQgc3RhY2s6MMKgwqDCoMKgIHBpZDoxOTAywqAg
dGdpZDoxNjI2wqAgcHBpZDoxMTUzIAo+PiBmbGFnczoweDAwMDAwMjBjCj4+IENhbGwgdHJhY2U6
Cj4+IMKgIF9fc3dpdGNoX3RvKzB4ZjQvMHgxNTgKPj4gwqAgX19zY2hlZHVsZSsweDI3Yy8weDkw
OAo+PiDCoCBydF9tdXRleF9zY2hlZHVsZSsweDMwLzB4NjAKPj4gwqAgX19ydF9tdXRleF9zbG93
bG9ja19sb2NrZWQuY29uc3Rwcm9wLjArMHg0NjAvMHg4YTgKPj4gwqAgcndiYXNlX3dyaXRlX2xv
Y2srMHgyNGMvMHgzNzgKPj4gwqAgZG93bl93cml0ZSsweDFjLzB4MzAKPj4gwqAgZjJmc19iYWxh
bmNlX2ZzKzB4MTg0LzB4MjA4Cj4+IMKgIGYyZnNfbWFwX2Jsb2NrcysweDk0Yy8weDExMTAKPj4g
wqAgZjJmc19maWxlX3dyaXRlX2l0ZXIrMHgyMjgvMHhiODAKPj4gwqAgZG9faXRlcl9yZWFkdl93
cml0ZXYrMHhmMC8weDFlMAo+PiDCoCB2ZnNfd3JpdGV2KzB4MTM4LzB4MmM4Cj4+IMKgIGRvX3dy
aXRldisweDg4LzB4MTMwCj4+IMKgIF9fYXJtNjRfc3lzX3dyaXRldisweDI4LzB4NDAKPj4gwqAg
aW52b2tlX3N5c2NhbGwrMHg1MC8weDEyMAo+PiDCoCBlbDBfc3ZjX2NvbW1vbi5jb25zdHByb3Au
MCsweGM4LzB4ZjAKPj4gwqAgZG9fZWwwX3N2YysweDI0LzB4MzgKPj4gwqAgZWwwX3N2YysweDMw
LzB4ZjgKPj4gwqAgZWwwdF82NF9zeW5jX2hhbmRsZXIrMHgxMjAvMHgxMzAKPj4gwqAgZWwwdF82
NF9zeW5jKzB4MTkwLzB4MTk4Cj4+Cj4+IElORk86IHRhc2sgc3luYzoyNzY5ODQ5IGJsb2NrZWQg
Zm9yIG1vcmUgdGhhbiAxMjAgc2Vjb25kcy4KPj4gwqDCoMKgwqDCoMKgIFRhaW50ZWQ6IEfCoMKg
wqDCoMKgwqDCoMKgwqDCoCBPwqDCoMKgwqDCoMKgIDYuMTIuNDEtZzNmZTA3ZGRmMDVhYiAjMQo+
PiAiZWNobyAwID4gL3Byb2Mvc3lzL2tlcm5lbC9odW5nX3Rhc2tfdGltZW91dF9zZWNzIiBkaXNh
YmxlcyB0aGlzIAo+PiBtZXNzYWdlLgo+PiB0YXNrOnN5bmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0YXRlOkQgc3RhY2s6MMKgwqDCoMKgIHBpZDoyNzY5ODQ5IHRnaWQ6Mjc2OTg0OSAKPj4gcHBp
ZDo3MzbCoMKgwqAgZmxhZ3M6MHgwMDAwMDIwYwo+PiBDYWxsIHRyYWNlOgo+PiDCoCBfX3N3aXRj
aF90bysweGY0LzB4MTU4Cj4+IMKgIF9fc2NoZWR1bGUrMHgyN2MvMHg5MDgKPj4gwqAgc2NoZWR1
bGUrMHgzYy8weDExOAo+PiDCoCB3Yl93YWl0X2Zvcl9jb21wbGV0aW9uKzB4YjAvMHhlOAo+PiDC
oCBzeW5jX2lub2Rlc19zYisweGM4LzB4MmIwCj4+IMKgIHN5bmNfaW5vZGVzX29uZV9zYisweDI0
LzB4MzgKPj4gwqAgaXRlcmF0ZV9zdXBlcnMrMHhhOC8weDEzOAo+PiDCoCBrc3lzX3N5bmMrMHg1
NC8weGM4Cj4+IMKgIF9fYXJtNjRfc3lzX3N5bmMrMHgxOC8weDMwCj4+IMKgIGludm9rZV9zeXNj
YWxsKzB4NTAvMHgxMjAKPj4gwqAgZWwwX3N2Y19jb21tb24uY29uc3Rwcm9wLjArMHhjOC8weGYw
Cj4+IMKgIGRvX2VsMF9zdmMrMHgyNC8weDM4Cj4+IMKgIGVsMF9zdmMrMHgzMC8weGY4Cj4+IMKg
IGVsMHRfNjRfc3luY19oYW5kbGVyKzB4MTIwLzB4MTMwCj4+IMKgIGVsMHRfNjRfc3luYysweDE5
MC8weDE5OAo+Pgo+PiBUaGUgcm9vdCBjYXVzZSBpcyBhIHBvdGVudGlhbCBkZWFkbG9jayBiZXR3
ZWVuIHRoZSBmb2xsb3dpbmcgdGFza3M6Cj4+Cj4+IGt3b3JrZXIvdTg6MTHCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgVGhyZWFkIEEKPj4gLSBmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3Bh
Z2UKPj4gwqAgLSBmMmZzX2RvX3dyaXRlX2RhdGFfcGFnZQo+PiDCoMKgIC0gZm9saW9fc3RhcnRf
d3JpdGViYWNrKFgpCj4+IMKgwqAgLSBmMmZzX291dHBsYWNlX3dyaXRlX2RhdGEKPj4gwqDCoMKg
IC0gYmlvX2FkZF9mb2xpbyhYKQo+PiDCoCAtIGZvbGlvX3VubG9jayhYKQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHRydW5jYXRlX2lub2RlX3BhZ2VzX3Jhbmdl
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBfX2ZpbGVtYXBf
Z2V0X2ZvbGlvKFgsIEZHUF9MT0NLKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC0gdHJ1bmNhdGVfaW5vZGVfcGFydGlhbF9mb2xpbyhYKQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBmb2xpb193YWl0X3dyaXRlYmFjayhY
KQo+PiDCoCAtIGYyZnNfYmFsYW5jZV9mcwo+PiDCoMKgIC0gZjJmc19nYwo+PiDCoMKgwqAgLSBk
b19nYXJiYWdlX2NvbGxlY3QKPj4gwqDCoMKgwqAgLSBtb3ZlX2RhdGFfcGFnZQo+PiDCoMKgwqDC
oMKgIC0gZjJmc19nZXRfbG9ja19kYXRhX3BhZ2UKPj4gwqDCoMKgwqDCoMKgIC0gX19maWxlbWFw
X2dldF9mb2xpbyhYLCBGR1BfTE9DSykKPj4KPj4gQm90aCB0aHJlYWRzIHRyeSB0byBhY2Nlc3Mg
Zm9saW8gWC4gVGhyZWFkIEEgaG9sZHMgdGhlIGxvY2sgYnV0IHdhaXRzCj4+IGZvciB3cml0ZWJh
Y2ssIHdoaWxlIGt3b3JrZXIgd2FpdHMgZm9yIHRoZSBsb2NrLiBUaGlzIGNhdXNlcyBhIGRlYWRs
b2NrLgo+Pgo+PiBPdGhlciB0aHJlYWRzIGFsc28gZW50ZXIgRCBzdGF0ZSwgd2FpdGluZyBmb3Ig
bG9ja3Mgc3VjaCBhcyBnY19sb2NrIGFuZAo+PiB3cml0ZXBhZ2VzLgo+Pgo+PiBUbyBhdm9pZCB0
aGlzIHBvdGVudGlhbCBkZWFkbG9jaywgYWx3YXlzIGNhbGwgZjJmc19zdWJtaXRfbWVyZ2VkX3dy
aXRlCj4+IGJlZm9yZSB0cmlnZ2VyaW5nIGYyZnNfZ2MgaW4gZjJmc19iYWxhbmNlX2ZzLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBSdWlwZW5nIFFpIDxydWlwZW5ncWkzQGdtYWlsLmNvbT4KPj4gLS0t
Cj4+IMKgIGZzL2YyZnMvc2VnbWVudC5jIHwgMTQgKysrKysrKysrKysrKysKPj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2Vn
bWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4gaW5kZXggNmE5N2ZlNzY3MTJiLi5iNTgyOTll
NDljMjMgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jCj4+ICsrKyBiL2ZzL2YyZnMv
c2VnbWVudC5jCj4+IEBAIC00NTQsNiArNDU0LDIwIEBAIHZvaWQgZjJmc19iYWxhbmNlX2ZzKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgCj4+IGJvb2wgbmVlZCkKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGlvX3NjaGVkdWxlKCk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBmaW5pc2hfd2FpdCgmc2Jp
LT5nY190aHJlYWQtPmZnZ2Nfd3EsICZ3YWl0KTsKPj4gwqDCoMKgwqDCoCB9IGVsc2Ugewo+PiAr
Cj4+ICvCoMKgwqDCoMKgwqDCoCAvKgo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIEJlZm9yZSB0cmln
Z2VyaW5nIGZvcmVncm91bmQgR0MsIHN1Ym1pdCBhbGwgY2FjaGVkIERBVEEKPj4gK8KgwqDCoMKg
wqDCoMKgwqAgKiB3cml0ZSBiaW9zLiBEdXJpbmcgd3JpdGViYWNrLCBwYWdlcyBtYXkgYmUgYWRk
ZWQgdG8KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiB3cml0ZV9pb1tEQVRBXS5iaW8gd2l0aCBQR193
cml0ZWJhY2sgc2V0IGJ1dCB0aGUgYmlvIG5vdAo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIHlldCBz
dWJtaXR0ZWQuIElmIEdDJ3MgbW92ZV9kYXRhX3BhZ2UoKSBibG9ja3Mgb24KPj4gK8KgwqDCoMKg
wqDCoMKgwqAgKiBfX2ZvbGlvX2xvY2soKSBmb3Igc3VjaCBhIGZvbGlvLCBhbmQgdGhlIGxvY2sg
aG9sZGVyIHdhaXRzCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogZm9yIFBHX3dyaXRlYmFjayB0byBj
bGVhciB2aWEgVkZTIGZvbGlvX3dhaXRfd3JpdGViYWNrKCkKPj4gK8KgwqDCoMKgwqDCoMKgwqAg
KiBuZWl0aGVyIHRocmVhZCBjYW4gbWFrZSBwcm9ncmVzcy4gRmx1c2hpbmcgaGVyZSBlbnN1cmVz
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgICogdGhlIGJpbyBjb21wbGV0aW9uIGNhbGxiYWNrIGNhbiBj
bGVhciBQR193cml0ZWJhY2suCj4+ICvCoMKgwqDCoMKgwqDCoMKgICovCj4+ICsKPj4gK8KgwqDC
oMKgwqDCoMKgIGYyZnNfc3VibWl0X21lcmdlZF93cml0ZShzYmksIERBVEEpOwo+Cj4gRG8gd2Ug
bmVlZCB0byBjYWxsIGYyZnNfc3VibWl0X21lcmdlZF9pcHVfd3JpdGUoc2JpLCBiaW8sIE5VTEwp
IHRvIGNvbW1pdAo+IGNhY2hlZCBJUFUgZm9saW9zIGFzIHdlbGw/Cj4KPiBOb3Qgc3VyZSwgdGhp
cyByYWNlIGNvbmRpdGlvbiB3aWxsIGhhcHBlbiBmb3Igbm9kZSBmb2xpby4KPgo+IFRoYW5rcywK
PgpIaSwgQ2hhbwoKVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uIEFmdGVyIGRlZXBlciBhbmFs
eXNpcywgdGhpcyByYWNlIGNvbmRpdGlvbgphcHBsaWVzIHRvIElQVSBmb2xpb3MgYnV0IG5vdCBu
b2RlIGZvbGlvcy4gTm9kZSBmb2xpb3MgYXJlIHVubGlrZWx5IHRvCmhhdmUgdGhpcyBmbG93LgoK
SSB3aWxsIHNlbmQgYSBjb3JyZWN0ZWQgdmVyc2lvbiBzaG9ydGx5Lgp2MjoKLSBDb21taXQgY2Fj
aGVkIE9QVSBhbmQgSVBVIGZvbGlvcywgbm90IGp1c3QgT1BVIGZvbGlvcyBhcyBpbiB2MS4KCkJU
VywgRG8geW91IHRoaW5rIGl0IGlzIHBvc3NpYmxlIHRvIGFkZCBhbiBvcHRpb25hbCAtPndhaXRf
Zm9saW9fd3JpdGViYWNrKCkKY2FsbGJhY2sgdG8gYWRkcmVzc19zcGFjZV9vcGVyYXRpb25zLiB3
aGVuIHByb3ZpZGVkLAp0cnVuY2F0ZV9pbm9kZV9wYXJ0aWFsX2ZvbGlvKCkgY2FsbHMgZjJmc193
YWl0X29uX3BhZ2Vfd3JpdGViYWNrIGluc3RlYWQgb2YKdGhlIGdlbmVyaWMgZm9saW9fd2FpdF93
cml0ZWJhY2soKSwgd2hpY2ggYWxzbyBmaXggdGhpcyByYWNlIGNvbmRpdGlvbi4KClRoYW5rcywK
Cj4+ICsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBmMmZzX2djX2NvbnRyb2wgZ2NfY29u
dHJvbCA9IHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnZpY3RpbV9zZWdubyA9IE5V
TExfU0VHTk8sCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5pbml0X2djX3R5cGUgPSBm
MmZzX3NiX2hhc19ibGt6b25lZChzYmkpID8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
