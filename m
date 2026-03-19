Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCQgOl4svGnXuAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 18:03:26 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EBA2CF584
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 18:03:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLF+d9rhmHsiEOUGeVOxhcM5FU7PZS5MlT/U4VGA5Qo=; b=NB8PD29pbQBU3D32j/OfzrDegp
	JaQ8DxjyN1dX6+uis9oRRndPQXS5wgbsmV/+oxb+ONtsK9oxCUrksgV62QNvb/9PrlCWNgLkwJSYL
	oWL5mQ5tuG+gkSSmA9XDjX/xZokN1LdTk1ETQ0uPC3ZKGO3dMK5u8HXhWGVdl/ZSiKbs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w3GmL-0008FJ-7Q;
	Thu, 19 Mar 2026 17:03:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1w3GmJ-0008F5-JN
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 17:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IR1dVbK2Vabbp3C1iCyFEKe4xEl1cUxgs6Eo2Ydvzp4=; b=QqNZsXBauxdD5NFPj18I9y6C6H
 ZLF9tJq9CMW9/XfydenmAZml6LYp0m8JP15AVX4brgFOiUhrHst15jfjnsZtgTuTyaxH/Nd40zc9z
 GEz7eibQu2PUlz9MZz6uTHqPsvbhguM+RsUg495GdyavRENIkPA1aNQ9gY8AwAVR0TzI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IR1dVbK2Vabbp3C1iCyFEKe4xEl1cUxgs6Eo2Ydvzp4=; b=ajzZUw+UifNfva86Q6zFvPK0Uo
 oxct7GK5GaFqYJOWpTSJbtva/PR+6T9qF9HCpfbu8ZorOLa7EyHPhAgTb1gnXcY81pa4nRbQGF6z0
 l0YuzpeLLVwuqNF8QFwA7N3c8FAteaA3KgB3yZaRdTF0Dz5c+dDAthW7Sfg5KX+iTim4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w3GmI-0005fh-J4 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 17:03:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 08DCC6057A;
 Thu, 19 Mar 2026 17:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B21FC2BCB0;
 Thu, 19 Mar 2026 17:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773939791;
 bh=NH8pSRJfn54SQYN0+b34+DPWc2Z6utrQ/USpQuyL7E8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gQjApc/8f0RRvcf+CNW6gICS5aH88hOjm4Hy8e4hRQfHXE3eW2zteCb6+EziHUHKq
 y+BYyAUfBzwTHhkS8tCln1e/2kQUju3rmlKOMU2RGSGPpcPYgxJNhsbcWbPGw8Ctgw
 nfEAP1izGHhYCnZQNwhPQg88+dSDvR9z5udblwArx/vEuQOmDc9o1266wKJxeE5WZu
 CXpGxCQUmIHinH9t53p0qScRTg+WIlyzPoA7ihXow219RAgrfBsqIruNAB2d1oKwyk
 wrBwJdvIV+/+RW+ezD+/VeSUNYL4lg0KzXT+jvMqw0UoV8aritiYxZiN18hQyHzbiu
 kblqDa/FluyOw==
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Date: Thu, 19 Mar 2026 18:01:59 +0100
Message-ID: <20260319170231.1455553-13-aalbersh@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260319170231.1455553-1-aalbersh@kernel.org>
References: <20260319170231.1455553-1-aalbersh@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Introduce XFS_DIFLAG2_VERITY for inodes with fsverity. This
 flag indicates that inode has fs-verity enabled (i.e. descriptor exist, tree
 is built and file is read-only). Introduce XFS_SB_FEAT_RO_COMPAT_VERITY for
 filesystems having fsverity inodes. As on-disk changes applies to fsverity
 inodes only, let older kernels read-only access. This will be enabled in
 the furth [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w3GmI-0005fh-J4
Subject: [f2fs-dev] [PATCH v5 12/25] xfs: introduce fsverity on-disk changes
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
From: Andrey Albershteyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, djwong@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-xfs@vger.kernel.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 87EBA2CF584
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SW50cm9kdWNlIFhGU19ESUZMQUcyX1ZFUklUWSBmb3IgaW5vZGVzIHdpdGggZnN2ZXJpdHkuIFRo
aXMgZmxhZwppbmRpY2F0ZXMgdGhhdCBpbm9kZSBoYXMgZnMtdmVyaXR5IGVuYWJsZWQgKGkuZS4g
ZGVzY3JpcHRvciBleGlzdCwKdHJlZSBpcyBidWlsdCBhbmQgZmlsZSBpcyByZWFkLW9ubHkpLgoK
SW50cm9kdWNlIFhGU19TQl9GRUFUX1JPX0NPTVBBVF9WRVJJVFkgZm9yIGZpbGVzeXN0ZW1zIGhh
dmluZwpmc3Zlcml0eSBpbm9kZXMuIEFzIG9uLWRpc2sgY2hhbmdlcyBhcHBsaWVzIHRvIGZzdmVy
aXR5IGlub2RlcyBvbmx5LCBsZXQKb2xkZXIga2VybmVscyByZWFkLW9ubHkgYWNjZXNzLiBUaGlz
IHdpbGwgYmUgZW5hYmxlZCBpbiB0aGUgZnVydGhlcgpwYXRjaCBhZnRlciBmdWxsIGZzdmVyaXR5
IHN1cHBvcnQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgQWxiZXJzaHRleW4gPGFhbGJlcnNoQGtl
cm5lbC5vcmc+ClJldmlld2VkLWJ5OiAiRGFycmljayBKLiBXb25nIiA8ZGp3b25nQGtlcm5lbC5v
cmc+Ci0tLQogZnMveGZzL2xpYnhmcy94ZnNfZm9ybWF0LmggICAgIHwgMzAgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystCiBmcy94ZnMvbGlieGZzL3hmc19pbm9kZV9idWYuYyAgfCAgOCAr
KysrKysrKwogZnMveGZzL2xpYnhmcy94ZnNfaW5vZGVfdXRpbC5jIHwgIDIgKysKIGZzL3hmcy9s
aWJ4ZnMveGZzX3NiLmMgICAgICAgICB8ICAyICsrCiBmcy94ZnMveGZzX2lvcHMuYyAgICAgICAg
ICAgICAgfCAgMiArKwogZnMveGZzL3hmc19tb3VudC5oICAgICAgICAgICAgIHwgIDIgKysKIDYg
ZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2ZzL3hmcy9saWJ4ZnMveGZzX2Zvcm1hdC5oIGIvZnMveGZzL2xpYnhmcy94ZnNfZm9ybWF0
LmgKaW5kZXggNzc5ZGFjNTliMWYzLi40ZGZmMjk2NTllNDAgMTAwNjQ0Ci0tLSBhL2ZzL3hmcy9s
aWJ4ZnMveGZzX2Zvcm1hdC5oCisrKyBiL2ZzL3hmcy9saWJ4ZnMveGZzX2Zvcm1hdC5oCkBAIC0z
NzQsNiArMzc0LDcgQEAgeGZzX3NiX2hhc19jb21wYXRfZmVhdHVyZSgKICNkZWZpbmUgWEZTX1NC
X0ZFQVRfUk9fQ09NUEFUX1JNQVBCVCAgICgxIDw8IDEpCQkvKiByZXZlcnNlIG1hcCBidHJlZSAq
LwogI2RlZmluZSBYRlNfU0JfRkVBVF9ST19DT01QQVRfUkVGTElOSyAgKDEgPDwgMikJCS8qIHJl
ZmxpbmtlZCBmaWxlcyAqLwogI2RlZmluZSBYRlNfU0JfRkVBVF9ST19DT01QQVRfSU5PQlRDTlQg
KDEgPDwgMykJCS8qIGlub2J0IGJsb2NrIGNvdW50cyAqLworI2RlZmluZSBYRlNfU0JfRkVBVF9S
T19DT01QQVRfVkVSSVRZICAgKDEgPDwgNCkJCS8qIGZzLXZlcml0eSAqLwogI2RlZmluZSBYRlNf
U0JfRkVBVF9ST19DT01QQVRfQUxMIFwKIAkJKFhGU19TQl9GRUFUX1JPX0NPTVBBVF9GSU5PQlQg
fCBcCiAJCSBYRlNfU0JfRkVBVF9ST19DT01QQVRfUk1BUEJUIHwgXApAQCAtMTIzMCwxNiArMTIz
MSwyMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgeGZzX2Rpbm9kZV9wdXRfcmRldihzdHJ1Y3QgeGZz
X2Rpbm9kZSAqZGlwLCB4ZnNfZGV2X3QgcmRldikKICAqLwogI2RlZmluZSBYRlNfRElGTEFHMl9N
RVRBREFUQV9CSVQJNQogCisvKiBpbm9kZXMgc2VhbGVkIHdpdGggZnMtdmVyaXR5ICovCisjZGVm
aW5lIFhGU19ESUZMQUcyX1ZFUklUWV9CSVQJCTYKKwogI2RlZmluZSBYRlNfRElGTEFHMl9EQVgJ
CSgxVUxMIDw8IFhGU19ESUZMQUcyX0RBWF9CSVQpCiAjZGVmaW5lIFhGU19ESUZMQUcyX1JFRkxJ
TksJKDFVTEwgPDwgWEZTX0RJRkxBRzJfUkVGTElOS19CSVQpCiAjZGVmaW5lIFhGU19ESUZMQUcy
X0NPV0VYVFNJWkUJKDFVTEwgPDwgWEZTX0RJRkxBRzJfQ09XRVhUU0laRV9CSVQpCiAjZGVmaW5l
IFhGU19ESUZMQUcyX0JJR1RJTUUJKDFVTEwgPDwgWEZTX0RJRkxBRzJfQklHVElNRV9CSVQpCiAj
ZGVmaW5lIFhGU19ESUZMQUcyX05SRVhUNjQJKDFVTEwgPDwgWEZTX0RJRkxBRzJfTlJFWFQ2NF9C
SVQpCiAjZGVmaW5lIFhGU19ESUZMQUcyX01FVEFEQVRBCSgxVUxMIDw8IFhGU19ESUZMQUcyX01F
VEFEQVRBX0JJVCkKKyNkZWZpbmUgWEZTX0RJRkxBRzJfVkVSSVRZCSgxVUxMIDw8IFhGU19ESUZM
QUcyX1ZFUklUWV9CSVQpCiAKICNkZWZpbmUgWEZTX0RJRkxBRzJfQU5ZIFwKIAkoWEZTX0RJRkxB
RzJfREFYIHwgWEZTX0RJRkxBRzJfUkVGTElOSyB8IFhGU19ESUZMQUcyX0NPV0VYVFNJWkUgfCBc
Ci0JIFhGU19ESUZMQUcyX0JJR1RJTUUgfCBYRlNfRElGTEFHMl9OUkVYVDY0IHwgWEZTX0RJRkxB
RzJfTUVUQURBVEEpCisJIFhGU19ESUZMQUcyX0JJR1RJTUUgfCBYRlNfRElGTEFHMl9OUkVYVDY0
IHwgWEZTX0RJRkxBRzJfTUVUQURBVEEgfCBcCisJIFhGU19ESUZMQUcyX1ZFUklUWSkKIAogc3Rh
dGljIGlubGluZSBib29sIHhmc19kaW5vZGVfaGFzX2JpZ3RpbWUoY29uc3Qgc3RydWN0IHhmc19k
aW5vZGUgKmRpcCkKIHsKQEAgLTIwMjEsNCArMjAyNywyNiBAQCBzdHJ1Y3QgeGZzX2FjbCB7CiAj
ZGVmaW5lIFNHSV9BQ0xfRklMRV9TSVpFCShzaXplb2YoU0dJX0FDTF9GSUxFKS0xKQogI2RlZmlu
ZSBTR0lfQUNMX0RFRkFVTFRfU0laRQkoc2l6ZW9mKFNHSV9BQ0xfREVGQVVMVCktMSkKIAorLyoK
KyAqIEF0IG1heGltdW0gb2YgOCBsZXZlbHMgd2l0aCAxMjggaGFzaGVzIHBlciBibG9jayAoMzIg
Ynl0ZXMgU0hBLTI1NikgbWF4aW11bQorICogdHJlZSBzaXplIGlzICgoMTI4Xjgg4oiSIDEpLygx
Mjgg4oiSIDEpKSA9IDU2NyoxMF4xMiBibG9ja3MuIFRoaXMgc2hvdWxkIGZpdCBpbgorICogNTMg
Yml0cyBhZGRyZXNzIHNwYWNlLgorICoKKyAqIEF0IHRoaXMgTWVya2xlIHRyZWUgc2l6ZSB3ZSBj
YW4gY292ZXIgMjk1RUIgbGFyZ2UgZmlsZS4gVGhpcyBpcyBtdWNoIGxhcmdlcgorICogdGhhbiB0
aGUgY3VycmVudGx5IHN1cHBvcnRlZCBmaWxlIHNpemUuCisgKgorICogRm9yIHNoYTUxMiB0aGUg
bGFyZ2VzdCBmaWxlIHdlIGNhbiBjb3ZlciBlbmRzIGF0IDEgPDwgNTAgb2Zmc2V0LCB0aGlzIGlz
IGFsc28KKyAqIGdvb2QuCisgKi8KKyNkZWZpbmUgWEZTX0ZTVkVSSVRZX0xBUkdFU1RfRklMRQko
KGxvZmZfdCkxVUxMIDw8IDUzKQorCisvKgorICogQWxpZ25tZW50IG9mIHRoZSBmc3Zlcml0eSBt
ZXRhZGF0YSBwbGFjZW1lbnQuIFRoaXMgaXMgbGFyZ2VzdCBzdXBwb3J0ZWQgUEFHRQorICogU0la
RSBmb3IgZnN2ZXJpdHkuIFRoaXMgaXMgdXNlZCB0byBzcGFjZSBvdXQgZGF0YSBhbmQgbWV0YWRh
dGEgaW4gcGFnZSBjYWNoZS4KKyAqIFRoZSBzcGFjaW5nIGlzIG5lY2Vzc2FyeSBmb3Igbm9uLWV4
cG9zdXJlIG9mIG1ldGFkYXRhIHRvIHVzZXJzcGFjZSBhbmQKKyAqIGNvcnJlY3QgbWVya2xlIHRy
ZWUgc3luZXRoZXNpcyBpbiB0aGUgaW9tYXAuCisgKi8KKyNkZWZpbmUgWEZTX0ZTVkVSSVRZX1NU
QVJUX0FMSUdOCSg2NTUzNikKKworCiAjZW5kaWYgLyogX19YRlNfRk9STUFUX0hfXyAqLwpkaWZm
IC0tZ2l0IGEvZnMveGZzL2xpYnhmcy94ZnNfaW5vZGVfYnVmLmMgYi9mcy94ZnMvbGlieGZzL3hm
c19pbm9kZV9idWYuYwppbmRleCAzNzk0ZTU0MTJlYmEuLmYyMTgxYzFiZWQ1NCAxMDA2NDQKLS0t
IGEvZnMveGZzL2xpYnhmcy94ZnNfaW5vZGVfYnVmLmMKKysrIGIvZnMveGZzL2xpYnhmcy94ZnNf
aW5vZGVfYnVmLmMKQEAgLTc2MCw2ICs3NjAsMTQgQEAgeGZzX2Rpbm9kZV92ZXJpZnkoCiAJICAg
ICF4ZnNfaGFzX3J0cmVmbGluayhtcCkpCiAJCXJldHVybiBfX3RoaXNfYWRkcmVzczsKIAorCS8q
IG9ubHkgcmVndWxhciBmaWxlcyBjYW4gaGF2ZSBmc3Zlcml0eSAqLworCWlmIChmbGFnczIgJiBY
RlNfRElGTEFHMl9WRVJJVFkpIHsKKwkJaWYgKCF4ZnNfaGFzX3Zlcml0eShtcCkpCisJCQlyZXR1
cm4gX190aGlzX2FkZHJlc3M7CisJCWlmICghU19JU1JFRyhtb2RlKSkKKwkJCXJldHVybiBfX3Ro
aXNfYWRkcmVzczsKKwl9CisKIAlpZiAoeGZzX2hhc196b25lZChtcCkgJiYKIAkgICAgZGlwLT5k
aV9tZXRhdHlwZSA9PSBjcHVfdG9fYmUxNihYRlNfTUVUQUZJTEVfUlRSTUFQKSkgewogCQlpZiAo
YmUzMl90b19jcHUoZGlwLT5kaV91c2VkX2Jsb2NrcykgPiBtcC0+bV9zYi5zYl9yZ2V4dGVudHMp
CmRpZmYgLS1naXQgYS9mcy94ZnMvbGlieGZzL3hmc19pbm9kZV91dGlsLmMgYi9mcy94ZnMvbGli
eGZzL3hmc19pbm9kZV91dGlsLmMKaW5kZXggNTUxZmE1MWJlZmI2Li42YjFlMjBhNGJiOWIgMTAw
NjQ0Ci0tLSBhL2ZzL3hmcy9saWJ4ZnMveGZzX2lub2RlX3V0aWwuYworKysgYi9mcy94ZnMvbGli
eGZzL3hmc19pbm9kZV91dGlsLmMKQEAgLTEyNiw2ICsxMjYsOCBAQCB4ZnNfaXAyeGZsYWdzKAog
CQkJZmxhZ3MgfD0gRlNfWEZMQUdfREFYOwogCQlpZiAoaXAtPmlfZGlmbGFnczIgJiBYRlNfRElG
TEFHMl9DT1dFWFRTSVpFKQogCQkJZmxhZ3MgfD0gRlNfWEZMQUdfQ09XRVhUU0laRTsKKwkJaWYg
KGlwLT5pX2RpZmxhZ3MyICYgWEZTX0RJRkxBRzJfVkVSSVRZKQorCQkJZmxhZ3MgfD0gRlNfWEZM
QUdfVkVSSVRZOwogCX0KIAogCWlmICh4ZnNfaW5vZGVfaGFzX2F0dHJfZm9yayhpcCkpCmRpZmYg
LS1naXQgYS9mcy94ZnMvbGlieGZzL3hmc19zYi5jIGIvZnMveGZzL2xpYnhmcy94ZnNfc2IuYwpp
bmRleCA0NzMyMmFkYjc2OTAuLmExNTUxMGViZDJmMSAxMDA2NDQKLS0tIGEvZnMveGZzL2xpYnhm
cy94ZnNfc2IuYworKysgYi9mcy94ZnMvbGlieGZzL3hmc19zYi5jCkBAIC0xNjUsNiArMTY1LDgg
QEAgeGZzX3NiX3ZlcnNpb25fdG9fZmVhdHVyZXMoCiAJCWZlYXR1cmVzIHw9IFhGU19GRUFUX1JF
RkxJTks7CiAJaWYgKHNicC0+c2JfZmVhdHVyZXNfcm9fY29tcGF0ICYgWEZTX1NCX0ZFQVRfUk9f
Q09NUEFUX0lOT0JUQ05UKQogCQlmZWF0dXJlcyB8PSBYRlNfRkVBVF9JTk9CVENOVDsKKwlpZiAo
c2JwLT5zYl9mZWF0dXJlc19yb19jb21wYXQgJiBYRlNfU0JfRkVBVF9ST19DT01QQVRfVkVSSVRZ
KQorCQlmZWF0dXJlcyB8PSBYRlNfRkVBVF9WRVJJVFk7CiAJaWYgKHNicC0+c2JfZmVhdHVyZXNf
aW5jb21wYXQgJiBYRlNfU0JfRkVBVF9JTkNPTVBBVF9GVFlQRSkKIAkJZmVhdHVyZXMgfD0gWEZT
X0ZFQVRfRlRZUEU7CiAJaWYgKHNicC0+c2JfZmVhdHVyZXNfaW5jb21wYXQgJiBYRlNfU0JfRkVB
VF9JTkNPTVBBVF9TUElOT0RFUykKZGlmZiAtLWdpdCBhL2ZzL3hmcy94ZnNfaW9wcy5jIGIvZnMv
eGZzL3hmc19pb3BzLmMKaW5kZXggMjA4NTQzZTU3ZWRhLi5jYTM2OWViOTY1NjEgMTAwNjQ0Ci0t
LSBhL2ZzL3hmcy94ZnNfaW9wcy5jCisrKyBiL2ZzL3hmcy94ZnNfaW9wcy5jCkBAIC0xNDE1LDYg
KzE0MTUsOCBAQCB4ZnNfZGlmbGFnc190b19pZmxhZ3MoCiAJCWZsYWdzIHw9IFNfTk9BVElNRTsK
IAlpZiAoaW5pdCAmJiB4ZnNfaW5vZGVfc2hvdWxkX2VuYWJsZV9kYXgoaXApKQogCQlmbGFncyB8
PSBTX0RBWDsKKwlpZiAoeGZsYWdzICYgRlNfWEZMQUdfVkVSSVRZKQorCQlmbGFncyB8PSBTX1ZF
UklUWTsKIAogCS8qCiAJICogU19EQVggY2FuIG9ubHkgYmUgc2V0IGR1cmluZyBpbm9kZSBpbml0
aWFsaXphdGlvbiBhbmQgaXMgbmV2ZXIgc2V0IGJ5CmRpZmYgLS1naXQgYS9mcy94ZnMveGZzX21v
dW50LmggYi9mcy94ZnMveGZzX21vdW50LmgKaW5kZXggZGRkNDAyOGJlOGQ2Li4wN2Y2YWEzYzNm
MjYgMTAwNjQ0Ci0tLSBhL2ZzL3hmcy94ZnNfbW91bnQuaAorKysgYi9mcy94ZnMveGZzX21vdW50
LmgKQEAgLTM4NSw2ICszODUsNyBAQCB0eXBlZGVmIHN0cnVjdCB4ZnNfbW91bnQgewogI2RlZmlu
ZSBYRlNfRkVBVF9FWENIQU5HRV9SQU5HRQkoMVVMTCA8PCAyNykJLyogZXhjaGFuZ2UgcmFuZ2Ug
Ki8KICNkZWZpbmUgWEZTX0ZFQVRfTUVUQURJUgkoMVVMTCA8PCAyOCkJLyogbWV0YWRhdGEgZGly
ZWN0b3J5IHRyZWUgKi8KICNkZWZpbmUgWEZTX0ZFQVRfWk9ORUQJCSgxVUxMIDw8IDI5KQkvKiB6
b25lZCBSVCBkZXZpY2UgKi8KKyNkZWZpbmUgWEZTX0ZFQVRfVkVSSVRZCQkoMVVMTCA8PCAzMCkJ
LyogZnMtdmVyaXR5ICovCiAKIC8qIE1vdW50IGZlYXR1cmVzICovCiAjZGVmaW5lIFhGU19GRUFU
X05PTElGRVRJTUUJKDFVTEwgPDwgNDcpCS8qIGRpc2FibGUgbGlmZXRpbWUgaGludHMgKi8KQEAg
LTQ0Miw2ICs0NDMsNyBAQCBfX1hGU19IQVNfRkVBVChleGNoYW5nZV9yYW5nZSwgRVhDSEFOR0Vf
UkFOR0UpCiBfX1hGU19IQVNfRkVBVChtZXRhZGlyLCBNRVRBRElSKQogX19YRlNfSEFTX0ZFQVQo
em9uZWQsIFpPTkVEKQogX19YRlNfSEFTX0ZFQVQobm9saWZldGltZSwgTk9MSUZFVElNRSkKK19f
WEZTX0hBU19GRUFUKHZlcml0eSwgVkVSSVRZKQogCiBzdGF0aWMgaW5saW5lIGJvb2wgeGZzX2hh
c19ydGdyb3Vwcyhjb25zdCBzdHJ1Y3QgeGZzX21vdW50ICptcCkKIHsKLS0gCjIuNTEuMgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
