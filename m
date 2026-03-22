Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJ5cHNNfwGmHHAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Mar 2026 22:32:03 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AAD2EADFB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Mar 2026 22:32:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yTiuCi60V52h5lxcNx4R6sT0RlkxJrpI9AgmYu5EYj0=; b=LA4gSD8FDTK+M5vOATwjpHyTkh
	z0FHEPgzjW3PeEAEOVIDu3Hx+WmlvWJeeyB45/02+4Lqxafpcpp5JeYxxSQAbamqE0fgVeyHyTrTI
	IE3NLMPSsxZnpB4kOBMnGRv5X6auEkvFS/YA1GAyt0PIqNEdmbiZTzxcQESXbAK7ckRI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4QOo-0007Sv-1G;
	Sun, 22 Mar 2026 21:31:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <geoo115@gmail.com>) id 1w4QOm-0007So-K8
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Mar 2026 21:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4C6UgCxKe0sQBrEkwelfJu0hnU1TbDD3Knl8fR7TkBk=; b=jzgkrW6aBN7GtbXqjm4vgUYiw/
 tT2vysryi8iFVV+1NdxwA9EbSFprb9kCRVfP8tO+I/H6O3hHytMXszUlFcYwdPEywHfEvK1KHVSLH
 VAse/ZPCO381DbOdZc6Y9JeCek4lFv+D1hQLUo2dJEqsqX/Jf3kDgkJps7IYo1JQlZWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4C6UgCxKe0sQBrEkwelfJu0hnU1TbDD3Knl8fR7TkBk=; b=E
 5wvaIi6vDkqe+ggxrTsw0ZN82dRBY6zfiVGRBUKI52STZ9O/UBxBlbZpTgSV8DmrksdO6/K4+gmpk
 Mviny11Tbyf+T5d/UmTvtWYuRDyt792i8X2q/HpyPcOzU7JrV3ujZyda7Yh/l3QnTqfueiG93badq
 zYOjxeEEmbtTFSQc=;
Received: from mail-dy1-f171.google.com ([74.125.82.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w4QOm-0007XV-2M for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Mar 2026 21:31:52 +0000
Received: by mail-dy1-f171.google.com with SMTP id
 5a478bee46e88-2c10a2e2cd1so1134496eec.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 22 Mar 2026 14:31:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774215101; cv=none;
 d=google.com; s=arc-20240605;
 b=GRuUc3uRRpMip702foLMQCtlbAE6c1ImJlIVsD4TEmIm99wYSHL/GclEoozq4nnvl2
 0jSn5yNOL+3e69musOo0xoAD5cqJIKjJRucwg6jEStsGurixlarmpGjBfeRvFBK42n6S
 eIqctn9C9wki23XoQreewqBeih41Ct0SUId38nfIq891E5sLNqqOmtPblRdrzV5RiKkx
 DlfQ/Na5TvHkKxGG3q9nvleOcgZMXXWYxZcTGIf3FSOHh2OaC3I5N59pRroR12TEvScy
 9tbq7uR0ibaOkGSHzIa0z21AW/X7lJGrqBq8PP0G4druhQnlCAvNFE5ebooEwDlhehqk
 I7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:dkim-signature;
 bh=4C6UgCxKe0sQBrEkwelfJu0hnU1TbDD3Knl8fR7TkBk=;
 fh=R1JdzpgyQPg8VjLtJQ1HZnXtH+lVO06gKc/8PzpOpjI=;
 b=BbNK0LbjAOUP1znk3mc9PKm7vUHnZdT6idYy1lrVGPjoIfeN2Ak+sdL9sotRssp4PH
 4sVQll/4MsKi29Z71t3lmbOqvuP7ccWv+Pd7XQBKWB6Ee2gZ+YoDSjpEex0y2e6amGcv
 RREZcQcdYzjC+ymhgl1LZ5FoFUmd9Asy8KVpdH5cg9rpJqbrTp1wu7ZxkM6vEBHnzyhg
 2NL63RH/PVNz2fILe2+uoNJM+Wkfr59WP7tsVrxLs4C7bCH7KwJddulGH1kbfjkGdChG
 +x38zXtMSfJoynE9DBL+PpF2DsbVIUxUymINitVuQjB9twIiRiSpqQVcuoTNPHvFFrtT
 qZnw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774215101; x=1774819901; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4C6UgCxKe0sQBrEkwelfJu0hnU1TbDD3Knl8fR7TkBk=;
 b=gs23vBl22UcpkYdAgsMCi3Q+0PXEw9YE16sMZFx7PxKLVweClOCftHekQM14SM84K9
 ej87rXbdOg4idpQkiZcZRZ2V6rE7+3h9XLmWYMi6lSjzf2LeqwvPmnoBo/aMN5KbloyC
 0Eav+wcTipLh7RApVeN1ZIH19GHqVShvcNqVzj+VejJQiRp7rRIg/EtSmErpEwb56qor
 lKxaxdPnoMBAbWtrq4KjlRxWjhY+CTtNC1lXzZO223P+ePvjtCuWfzwaFVslGaNRz+WQ
 cG3wHP76vAN+O9KsJEvXuKNqRZgn5eLsKHfaPrSdRTL8LeMKMLQdD32YCQVsxtTFXx0+
 HVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774215101; x=1774819901;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4C6UgCxKe0sQBrEkwelfJu0hnU1TbDD3Knl8fR7TkBk=;
 b=a1eZzgJ3iD4O/chb1GcddtpcsGHSyDZCy4Uo9Lnyp88OWh3DB096h8VLcegntuQuk7
 mhkQ8UwVwyBMFwh3y+VUIJUSUJQFyoXCL189A78oiH4cHeVM98peHzNUpmqcjDcT+8xj
 zqiGj6lqlLY+TEUtFG9WQGmnuoswNSslJNnHyfX5Lrg9wNGA2864uXpcyJkx6nZttJwN
 4/QDYlDSXjxi4tJbDyS1HEC5TGPqe7VmkVB9ITNscPuDRjHj8Co2xVYjdAVyN/A0Wm2w
 4/87I62GnZaL9+J4SRG02aaeKpqRAknNODr1C0eSB40d/XsjoIQCyZ3Lxdb7h76WPlHO
 OELA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7vgeJfqWWOQi3HcDtlgz8kd82jNgIf2w4RfMOH18ZD8fO1OQkE2Xz2vMoiJzfVFdIOk5IM15MwZ9igjIhhCha@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzi0ueWIEZrjAKmQppI3xsP1kTLJWgPPUMRc1N1vZc/Mq7UWq5h
 HcM1TwIT8JTotoL5OwvepXO3Q64SaMmVLEG5bPptib53uCY5h4zUT/QrtTKLdGaZfMTAj49tvrc
 +SiOYja8I9eY21rehyZoW8hkHkr/NXnycPtFXlgE=
X-Gm-Gg: ATEYQzxEL8axXXVZCLrcvLsan7x5iB5e/4cLdS2ljbd/UrO72VmdvAEGVIm4PFk/lNM
 PZHjHOCIW8EEw0ckOghHAswHlBtJ7Z+AI9wuScXVb/vXbZlTyUbGhuELQ6zHfcKAYpklzA+/8MI
 FJyd3Lt/mpLKLmxbkR+62ZLYvFy/EswC98WkTALMTWzhuSNEshyplRH0jhclsYxgmxvAK+24IpT
 xYZBaIhf23HRc1yTqy+cOHYenyK/okJHLujKW6mY1pMVZqmfT0IcV+yy7n3F2VtbPaDSw9s5Arg
 7dBEc08fJohgwy8Zte63rmFpFwGpYwDh6jNgdOKVv8GenFZl/yY7Unv+7IqItSHPVOM9/SOBPba
 K9ZQLQKD8F0/ZdasW59NEvKenow==
X-Received: by 2002:a05:693c:2c94:b0:2ba:6d87:cf6e with SMTP id
 5a478bee46e88-2c10957721amr5041852eec.4.1774215101403; Sun, 22 Mar 2026
 14:31:41 -0700 (PDT)
MIME-Version: 1.0
From: G S <geoo115@gmail.com>
Date: Sun, 22 Mar 2026 21:31:30 +0000
X-Gm-Features: AQROBzBEeR0o_C5YMGAhgq0YPaqaxyChVGjJazyKYndwCKGTxInbqoaHffqTBDc
Message-ID: <CAHor6QJaim=omkU2Uacqrwu5OnzYEcPOseFUoYy3e6KxecdQDA@mail.gmail.com>
To: security@kernel.org
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, I found a use-after-free in f2fs_compress_write_end_io()
 that is the same class of bug as CVE-2026-23234 (UAF in f2fs_write_end_io())
 but in the compressed page write completion path. The CVE-2026-232 [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [geoo115(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [geoo115(at)gmail.com]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [74.125.82.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w4QOm-0007XV-2M
Subject: [f2fs-dev] [PATCH] f2fs: fix use-after-free in
 f2fs_compress_write_end_io()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:security@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geoo115@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geoo115@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 80AAD2EADFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGksCgpJIGZvdW5kIGEgdXNlLWFmdGVyLWZyZWUgaW4gZjJmc19jb21wcmVzc193cml0ZV9lbmRf
aW8oKSB0aGF0IGlzIHRoZQpzYW1lIGNsYXNzIG9mIGJ1ZyBhcyBDVkUtMjAyNi0yMzIzNCAoVUFG
IGluIGYyZnNfd3JpdGVfZW5kX2lvKCkpIGJ1dAppbiB0aGUgY29tcHJlc3NlZCBwYWdlIHdyaXRl
IGNvbXBsZXRpb24gcGF0aC4gVGhlIENWRS0yMDI2LTIzMjM0IGZpeApkb2VzIG5vdCBjb3ZlciB0
aGlzIGZ1bmN0aW9uLgoKQnVnIGRlc2NyaXB0aW9uCi0tLS0tLS0tLS0tLS0tLQpJbiBmMmZzX2Nv
bXByZXNzX3dyaXRlX2VuZF9pbygpIChmcy9mMmZzL2NvbXByZXNzLmM6MTQ3OCksIHRoZQpjb21w
bGV0aW9uIGNhbGxiYWNrIGFjY2Vzc2VzIHNiaSBhZnRlciBhbiBvcGVyYXRpb24gdGhhdCBhbGxv
d3MgYQpjb25jdXJyZW50IHVubW91bnQgdG8gZnJlZSBpdC4KClRoZSB1bm1vdW50IHBhdGggaW4g
ZjJmc19wdXRfc3VwZXIoKSAoc3VwZXIuYzoxOTg1KSBjYWxsczoKICAgIGYyZnNfd2FpdF9vbl9h
bGxfcGFnZXMoc2JpLCBGMkZTX1dCX0NQX0RBVEEpOwoKVGhpcyB3YWl0cyB1bnRpbCBnZXRfcGFn
ZXMoc2JpLCBGMkZTX1dCX0NQX0RBVEEpIHJldHVybnMgMCwgdGhlbgpwcm9jZWVkcyB0byB0ZWFy
IGRvd24gc2JpIChzdXBlci5jOjIwMjgtMjAzMCwga2ZyZWUgYXQgNTM3Ny81NDU4KS4KCkNvbXBy
ZXNzZWQgd3JpdGViYWNrIGJpb3MgdXNlIHR5cGUgRjJGU19XQl9DUF9EQVRBIChiZWNhdXNlCldC
X0RBVEFfVFlQRSBldmFsdWF0ZXMgZjJmc19pc19jb21wcmVzc2VkX3BhZ2UoKSBhcyB0cnVlIGF0
CmNvbXByZXNzLmM6MTQ4My0xNDg0KS4gVGhpcyBtZWFucyBmMmZzX3dhaXRfb25fYWxsX3BhZ2Vz
IHN0cnVjdHVyYWxseQp3YWl0cyBmb3IgYWxsIGNvbXByZXNzZWQgYmlvIGNvbXBsZXRpb25zIHRv
IGNhbGwgZGVjX3BhZ2VfY291bnQoKQpiZWZvcmUgdW5tb3VudCBwcm9jZWVkcy4gQSBiaW8gY2Fu
bm90IGNvbXBsZXRlIGFmdGVyIHNiaSBpcyBmcmVlZAp2aWEgdGhlIG5vcm1hbCBwYXRoIOKAlCB0
aGUgd2FpdCBsb29wIGNyZWF0ZXMgYW4gb3JkZXJpbmcgZGVwZW5kZW5jeS4KCkhvd2V2ZXIsIHRo
ZSBvcmRlcmluZyBvbmx5IGd1YXJhbnRlZXMgdGhhdCBkZWNfcGFnZV9jb3VudCgpIGhhcyBydW4u
Ckl0IGRvZXMgTk9UIGd1YXJhbnRlZSB0aGF0IHRoZSBjb21wbGV0aW9uIGNhbGxiYWNrIGhhcyBm
aW5pc2hlZCBhbGwKc3Vic2VxdWVudCBzYmkgYWNjZXNzZXMuIFRoZSByYWNlIGlzOgoKICAgIGYy
ZnNfY29tcHJlc3Nfd3JpdGVfZW5kX2lvKCk6CiAgICAgIHNiaSA9IGJpby0+YmlfcHJpdmF0ZSAg
ICAgICAgICAgICAgIC8vIGxpbmUgMTQ4MQogICAgICBkZWNfcGFnZV9jb3VudChzYmksIHR5cGUp
ICAgICAgICAgICAgLy8gbGluZSAxNDkyIOKAlCBkZWNyZW1lbnRzIGNvdW50ZXIKICAgICAgICDi
hpIgaWYgdGhpcyBpcyB0aGUgbGFzdCBiaW8sIGNvdW50ZXIgaGl0cyAwCiAgICAgICAg4oaSIGYy
ZnNfd2FpdF9vbl9hbGxfcGFnZXMoKSBvbiB1bm1vdW50IENQVSByZXR1cm5zCiAgICAgICAg4oaS
IGYyZnNfcHV0X3N1cGVyKCkgY29udGludWVzOgogICAgICAgICAgICBmMmZzX2Rlc3Ryb3lfcGFn
ZV9hcnJheV9jYWNoZShzYmkpICAvLyBzdXBlci5jOjIwMzAKICAgICAgICAgICAga2ZyZWUoc2Jp
KSAgICAgICAgICAgICAgICAgICAgICAgICAgLy8gc3VwZXIuYzo1Mzc3IG9yIDU0NTgKICAgICAg
W2NhbGxiYWNrIHN0aWxsIGV4ZWN1dGluZyBvbiB0aGlzIENQVTpdCiAgICAgIGZvciAoaSA9IDA7
IC4uLikgewogICAgICAgICAgZW5kX3BhZ2Vfd3JpdGViYWNrKGNpYy0+cnBhZ2VzW2ldKSAgICAv
LyBsaW5lIDE1MDAKICAgICAgfQogICAgICBwYWdlX2FycmF5X2ZyZWUoc2JpLCAuLi4pICAgICAg
ICAgICAgICAgICAvLyBsaW5lIDE1MDMg4oCUIFVBRgoKT25jZSBkZWNfcGFnZV9jb3VudCgpIGJy
aW5ncyB0aGUgRjJGU19XQl9DUF9EQVRBIGNvdW50ZXIgdG8gemVybywKZjJmc193YWl0X29uX2Fs
bF9wYWdlcyByZXR1cm5zIG9uIHRoZSB1bm1vdW50IENQVSwgYW5kIGYyZnNfcHV0X3N1cGVyCnBy
b2NlZWRzIHRvIGZyZWUgc2JpLiBUaGUgY29tcGxldGlvbiBjYWxsYmFjayBvbiB0aGUgYmlvIENQ
VSBpcyBzdGlsbApiZXR3ZWVuIGxpbmVzIDE0OTIgYW5kIDE1MDMsIGFuZCB0aGUgc3Vic2VxdWVu
dCBwYWdlX2FycmF5X2ZyZWUoc2JpLAouLi4pIGRlcmVmZXJlbmNlcyBzYmktPnBhZ2VfYXJyYXlf
c2xhYl9zaXplIChjb21wYXJpc29uIGF0CmNvbXByZXNzLmM6NDMpIGFuZCBzYmktPnBhZ2VfYXJy
YXlfc2xhYiAocGFzc2VkIHRvIGttZW1fY2FjaGVfZnJlZQphdCBjb21wcmVzcy5jOjQ0KSwgYm90
aCB3aXRoaW4gdGhlIGZyZWVkIGYyZnNfc2JfaW5mbyBzdHJ1Y3R1cmUuCgpOb3RlOiBkZWNfcGFn
ZV9jb3VudCgpIGF0IGxpbmUgMTQ5MiBydW5zIGZvciBFVkVSWSBjb21wcmVzc2VkIGZvbGlvCmlu
IHRoZSBiaW8sIGJ1dCBwYWdlX2FycmF5X2ZyZWUoKSBhdCBsaW5lIDE1MDMgb25seSBydW5zIHdo
ZW4KYXRvbWljX2RlY19yZXR1cm4oJmNpYy0+cGVuZGluZ19wYWdlcykgcmVhY2hlcyB6ZXJvLiBU
aGUgcmFjZQpzcGVjaWZpY2FsbHkgcmVxdWlyZXMgdGhlIExBU1QgYmlvIGNvbXBsZXRpb24gZm9y
IGEgZ2l2ZW4gY2ljIOKAlAplYXJsaWVyIGNvbXBsZXRpb25zIHJldHVybiBhdCBsaW5lIDE0OTUg
YW5kIG5ldmVyIHJlYWNoCnBhZ2VfYXJyYXlfZnJlZS4KCkltcGFjdAotLS0tLS0KZjJmcyB3aXRo
IGNvbXByZXNzaW9uIGVuYWJsZWQgKGNvbXByZXNzX2FsZ29yaXRobT1sejQvenN0ZCkgaXMgdGhl
CmRlZmF1bHQgb24gQW5kcm9pZCBkZXZpY2VzIChQaXhlbCA2KywgU2Ftc3VuZyBHYWxheHkgUzIx
KykuIEFueQp1bnByaXZpbGVnZWQgYXBwIHBlcmZvcm1pbmcgZmlsZSBJL08gb24gYSBjb21wcmVz
c2VkIGYyZnMgZGlyZWN0b3J5CnRyaWdnZXJzIGNvbXByZXNzZWQgd3JpdGViYWNrLiBUaGUgVUFG
IGlzIG9uIGYyZnNfc2JfaW5mbyB3aGljaCBpcyBhCmxhcmdlIHN0cnVjdHVyZSBjb250YWluaW5n
IHNsYWIgY2FjaGUgcG9pbnRlcnMsIG1ha2luZyBoZWFwLXNwcmF5LWJhc2VkCmV4cGxvaXRhdGlv
biBmZWFzaWJsZSBmb3IgcHJpdmlsZWdlIGVzY2FsYXRpb24uCgpBZmZlY3RlZCB2ZXJzaW9ucwot
LS0tLS0tLS0tLS0tLS0tLQpBbGwga2VybmVscyBzaW5jZSBmMmZzIGNvbXByZXNzaW9uIHdyaXRl
YmFjayBzdXBwb3J0IHdhcyBpbnRyb2R1Y2VkCih2NS42KywgY29tbWl0IDRjOGZmNzA5YzYgImYy
ZnM6IHN1cHBvcnQgZGF0YSBjb21wcmVzc2lvbiIpIHRocm91Z2gKYXQgbGVhc3QgdjYuMTkuIFRo
ZSBDVkUtMjAyNi0yMzIzNCBwYXRjaCBmb3IgZjJmc193cml0ZV9lbmRfaW8oKSBkb2VzCm5vdCBm
aXggdGhpcyBmdW5jdGlvbi4KCk5vdGU6IGYyZnNfd3JpdGVfZW5kX2lvKCkgaW4gZGF0YS5jOjMx
NyBoYXMgdGhlIHNhbWUgc3RydWN0dXJhbCBwcm9ibGVtCmZvciBub24tY29tcHJlc3NlZCBmb2xp
b3MuIENWRS0yMDI2LTIzMjM0IGFkZHJlc3NlZCBpdCB0aGVyZS4gQm90aApmdW5jdGlvbnMgc2hh
cmUgdGhlIHJvb3QgY2F1c2U6IG1pc3NpbmcgbGlmZXRpbWUgbWFuYWdlbWVudCBvbiBzYmkKYWNy
b3NzIGFzeW5jIGJpbyBjb21wbGV0aW9uLgoKRml4Ci0tLQpUaGUgcm9vdCBjYXVzZSBpcyB0aGF0
IGFmdGVyIGRlY19wYWdlX2NvdW50KCkgdW5ibG9ja3MgdW5tb3VudCwgdGhlCmNhbGxiYWNrIGNv
bnRpbnVlcyB0byBhY2Nlc3Mgc2JpIHZpYSBwYWdlX2FycmF5X2ZyZWUoKS4gVGhlIG5hcnJvd2Vz
dApjb3JyZWN0IGZpeCBpcyB0byBlbnN1cmUgYWxsIHNiaSBhY2Nlc3NlcyBpbiB0aGUgY2FsbGJh
Y2sgY29tcGxldGUKYmVmb3JlIHRoZSBjb3VudGVyIGRlY3JlbWVudCB0aGF0IHNpZ25hbHMgdW5t
b3VudC4KCkFwcHJvYWNoIDEgKHJlb3JkZXIpOiBNb3ZlIHBhZ2VfYXJyYXlfZnJlZSgpIGJlZm9y
ZSBkZWNfcGFnZV9jb3VudCgpLgpUaGlzIGlzIG5vdCBzdHJhaWdodGZvcndhcmQgYmVjYXVzZSBk
ZWNfcGFnZV9jb3VudCBpcyBwZXItZm9saW8gYnV0CnBhZ2VfYXJyYXlfZnJlZSBvbmx5IHJ1bnMg
b24gdGhlIGxhc3QgcGVuZGluZyBwYWdlIChhZnRlciB0aGUKYXRvbWljX2RlY19yZXR1cm4gY2hl
Y2sgYXQgbGluZSAxNDk0KS4gVGhlIHBlci1mb2xpbyBkZWNfcGFnZV9jb3VudAphdCBsaW5lIDE0
OTIgY2FuIHVuYmxvY2sgdW5tb3VudCBiZWZvcmUgdGhlIGxhc3QtcGFnZSBwYXRoIHJlYWNoZXMK
cGFnZV9hcnJheV9mcmVlIGF0IGxpbmUgMTUwMy4KCkFwcHJvYWNoIDIgKGNhY2hlIHNiaSBmaWVs
ZHMpOiBDYWNoZSBzYmktPnBhZ2VfYXJyYXlfc2xhYiBhbmQKc2JpLT5wYWdlX2FycmF5X3NsYWJf
c2l6ZSBpbnRvIGxvY2FsIHZhcmlhYmxlcyBhdCBmdW5jdGlvbiBlbnRyeQooYmVmb3JlIGRlY19w
YWdlX2NvdW50KSwgdGhlbiB1c2UgdGhlIGNhY2hlZCB2YWx1ZXMgaW4gdGhlCnBhZ2VfYXJyYXlf
ZnJlZSBlcXVpdmFsZW50IGF0IGxpbmUgMTUwMy4gVGhpcyBhdm9pZHMgZGVyZWZlcmVuY2luZwpz
YmkgYWZ0ZXIgaXQgbWF5IGhhdmUgYmVlbiBmcmVlZDoKCi0tLSBhL2ZzL2YyZnMvY29tcHJlc3Mu
YworKysgYi9mcy9mMmZzL2NvbXByZXNzLmMKQEAgLTE0NzgsNiArMTQ3OCw4IEBAIHZvaWQgZjJm
c19jb21wcmVzc193cml0ZV9lbmRfaW8oc3RydWN0IGJpbyAqYmlvLApzdHJ1Y3QgZm9saW8gKmZv
bGlvKQogewogIHN0cnVjdCBwYWdlICpwYWdlID0gJmZvbGlvLT5wYWdlOwogIHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSA9IGJpby0+YmlfcHJpdmF0ZTsKKyBzdHJ1Y3Qga21lbV9jYWNoZSAqcGFf
c2xhYiA9IHNiaS0+cGFnZV9hcnJheV9zbGFiOworIHVuc2lnbmVkIGludCBwYV9zbGFiX3NpemUg
PSBzYmktPnBhZ2VfYXJyYXlfc2xhYl9zaXplOwogIHN0cnVjdCBjb21wcmVzc19pb19jdHggKmNp
YyA9IGZvbGlvLT5wcml2YXRlOwogIGVudW0gY291bnRfdHlwZSB0eXBlID0gV0JfREFUQV9UWVBF
KGZvbGlvLAogIGYyZnNfaXNfY29tcHJlc3NlZF9wYWdlKGZvbGlvKSk7CkBAIC0xNDk3LDcgKzE0
OTksMTIgQEAgdm9pZCBmMmZzX2NvbXByZXNzX3dyaXRlX2VuZF9pbyhzdHJ1Y3QgYmlvCipiaW8s
IHN0cnVjdCBmb2xpbyAqZm9saW8pCiAgZW5kX3BhZ2Vfd3JpdGViYWNrKGNpYy0+cnBhZ2VzW2ld
KTsKICB9CgotIHBhZ2VfYXJyYXlfZnJlZShzYmksIGNpYy0+cnBhZ2VzLCBjaWMtPm5yX3JwYWdl
cyk7CisgLyoKKyAqIFVzZSBjYWNoZWQgc2xhYiBmaWVsZHM6IGFmdGVyIGRlY19wYWdlX2NvdW50
IGFib3ZlLCB1bm1vdW50IG1heQorICogaGF2ZSBmcmVlZCBzYmkuIFRoaXMgaXMgdGhlIGNvbXBy
ZXNzLXBhdGggYW5hbG9nIG9mIENWRS0yMDI2LTIzMjM0LgorICovCisgaWYgKGxpa2VseShzaXpl
b2Yoc3RydWN0IHBhZ2UgKikgKiBjaWMtPm5yX3JwYWdlcyA8PSBwYV9zbGFiX3NpemUpKQorIGtt
ZW1fY2FjaGVfZnJlZShwYV9zbGFiLCBjaWMtPnJwYWdlcyk7CisgZWxzZQorIGtmcmVlKGNpYy0+
cnBhZ2VzKTsKICBrbWVtX2NhY2hlX2ZyZWUoY2ljX2VudHJ5X3NsYWIsIGNpYyk7CiB9CgpUaGlz
IGlzIHNhZmUgYmVjYXVzZSBzYmkgaXMgc3RpbGwgdmFsaWQgYXQgZnVuY3Rpb24gZW50cnkgKHRo
ZQpGMkZTX1dCX0NQX0RBVEEgY291bnRlciBpcyBub256ZXJvLCBwcmV2ZW50aW5nIHVubW91bnQg
ZnJvbQpwcm9jZWVkaW5nKS4gVGhlIGNhY2hlZCB2YWx1ZXMgYXJlIHJlYWQgYmVmb3JlIGRlY19w
YWdlX2NvdW50KCkKYXQgbGluZSAxNDkyLCB3aGljaCBpcyB0aGUgb3BlcmF0aW9uIHRoYXQgY2Fu
IHVuYmxvY2sgdW5tb3VudC4KCkFwcHJvYWNoIDMgKHN1cGVyYmxvY2sgcmVmZXJlbmNlKTogYXRv
bWljX2luYygmc2JpLT5zYi0+c19hY3RpdmUpIGF0CmJpbyBhbGxvY2F0aW9uIChkYXRhLmM6NDcw
KSwgZGVhY3RpdmF0ZV9zdXBlcihzYmktPnNiKSBhdCBiaW8KY29tcGxldGlvbiAoZGF0YS5jLCBi
ZWZvcmUgYmlvX3B1dCkuIFRoaXMgaXMgdGhlIG1vc3Qgcm9idXN0IGZpeCBidXQKbm90ZTogZGVh
Y3RpdmF0ZV9zdXBlcigpIGNhbiBjYWxsIGRvd25fd3JpdGUoJnNiLT5zX3Vtb3VudCkg4oCUIGEK
c2xlZXBpbmcgbG9jayDigJQgaWYgaXQgZHJvcHMgdGhlIGxhc3Qgc19hY3RpdmUgcmVmZXJlbmNl
LiBJbiBwcmFjdGljZQp0aGlzIGlzIHNhZmUgYmVjYXVzZSB0aGUgVkZTIG1vdW50IGhvbGRzIGFu
IGluZGVwZW5kZW50IHNfYWN0aXZlCnJlZmVyZW5jZSB1bnRpbCB1bm1vdW50IGNvbXBsZXRlcywg
ZW5zdXJpbmcgdGhlIGJpbyBjb21wbGV0aW9uIGNhbGwKaXMgbmV2ZXIgdGhlIGxhc3QgcmVsZWFz
ZS4gTmV2ZXJ0aGVsZXNzLCBpZiB0aGlzIGFwcHJvYWNoIGlzIGNob3NlbiwKYSBjb21tZW50IGRv
Y3VtZW50aW5nIHRoaXMgaW52YXJpYW50IHNob3VsZCBiZSBhZGRlZC4KCkZpeGVzOiA0YzhmZjcw
OWM2ICgiZjJmczogc3VwcG9ydCBkYXRhIGNvbXByZXNzaW9uIikKUmVwb3J0ZWQtYnk6IEdlb3Jn
ZSBTYWFkIDxnZW9vMTE1QGdtYWlsLmNvbT4KClRoYW5rcywKR2VvcmdlCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
