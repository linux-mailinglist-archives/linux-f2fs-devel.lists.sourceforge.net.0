Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLrJOjWrDWqK1QUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 14:38:13 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9E958DD9A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 14:38:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRUZalc1dv/fZ6Fz5WE/0KUMgIs30pI20PgTIFyn0QI=; b=XMbUxbPqDjE2WT4bKkDCqsVZLE
	Ve3ouR/z16o8eymNGfVzRxtYocGLmbNbo0QbkB1XeCDfdGZy3KZCkibkUUMImxmjFuDVMNsLi0gNl
	QuU8WpdsfeZ5YlX0p7tVNjENNLvhzEhEpmx0uqvVhSMWc+oMKfqu+S0A9gpwQFdXjCYE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPgBf-00070E-5j;
	Wed, 20 May 2026 12:38:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1wPgBc-0006zj-0H
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 12:38:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gg4rCyFYhv5l6Q+vqxuwS2I+3QnGOKPEeHuiVn6kbnY=; b=R8YhlPUbIFOZUxXm69fSYp0eyZ
 UvS+EGLc4Gfq2nym/wHZr6Fxkqu+iPIRS+ASmG6VF+FOKFaWqjWL/yNygnIKYHRUp7T3r6FT966ik
 22Np8JEH3oBvB95S7ya/Q6ZBOY/8lL2JOEdF4ScUwMyoWy403Lsj5RSuXzpsaWuYTEO0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gg4rCyFYhv5l6Q+vqxuwS2I+3QnGOKPEeHuiVn6kbnY=; b=eU3ADKgSW6U7Hnzh+ra4nLMmw9
 9xQoHjKwcCHIIyz7t/lHmGtS2llkU1P7etXpi6ft9A9iYvk45AhVawsBiEW9QNxxTczzin4kE+5UY
 JU87DRqbO14nKRg+XHDoy+2uSXPLuPYa697q2Zhpn3GGA0VNLpKAh9on6Mbt1ppgDsxQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wPgBX-0006ZY-Ci for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 12:38:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 4CB4C6014B;
 Wed, 20 May 2026 12:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B021F00896;
 Wed, 20 May 2026 12:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779280673;
 bh=gg4rCyFYhv5l6Q+vqxuwS2I+3QnGOKPEeHuiVn6kbnY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=SM2CLHjla0ZOYmC7wAXU33ttnandNjccSaeryM2ZkTpztoQtvSL1HpBSvD8Vt9Lpg
 r3vVfW/7gaMRxvbX7T0RBpfItX0QGD+QoDR2TCVBdmaCj2uSfYKFBHwgDSKonhHWuc
 k+xcnuesU/28qglhxpGXEJdRS/lI4I+hw1L3x8DXwD1ikJh+vBqP9MmX0Ko0H/wDxu
 2Yje+1CSfTNCb07p4BwBMTEHKqhfuy99EiGO6la4M7KRHqFx897wyRA8hXRJzHSQrP
 xYO5eh9YGEcF0YJngj4sm5+Igd4ov1s7/j7OR9O1w9nUY9B3kuH1ORhn6lbDUBGCmi
 s0oNe5alCDWjQ==
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Date: Wed, 20 May 2026 14:37:08 +0200
Message-ID: <20260520123722.405752-11-aalbersh@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260520123722.405752-1-aalbersh@kernel.org>
References: <20260520123722.405752-1-aalbersh@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wPgBX-0006ZY-Ci
Subject: [f2fs-dev] [PATCH v10 10/22] xfs: introduce fsverity on-disk changes
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
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, hch@lst.de, linux-btrfs@vger.kernel.org
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-xfs@vger.kernel.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 4E9E958DD9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SW50cm9kdWNlIFhGU19ESUZMQUcyX1ZFUklUWSBmb3IgaW5vZGVzIHdpdGggZnN2ZXJpdHkuIFRo
aXMgZmxhZwppbmRpY2F0ZXMgdGhhdCBpbm9kZSBoYXMgZnMtdmVyaXR5IGVuYWJsZWQgKGkuZS4g
ZGVzY3JpcHRvciBleGlzdCwKdHJlZSBpcyBidWlsdCBhbmQgZmlsZSBpcyByZWFkLW9ubHkpLgoK
SW50cm9kdWNlIFhGU19TQl9GRUFUX1JPX0NPTVBBVF9WRVJJVFkgZm9yIGZpbGVzeXN0ZW1zIGhh
dmluZwpmc3Zlcml0eSBpbm9kZXMuIEFzIG9uLWRpc2sgY2hhbmdlcyBhcHBsaWVzIHRvIGZzdmVy
aXR5IGlub2RlcyBvbmx5LCBsZXQKb2xkZXIga2VybmVscyByZWFkLW9ubHkgYWNjZXNzLiBUaGlz
IHdpbGwgYmUgZW5hYmxlZCBpbiB0aGUgZnVydGhlcgpwYXRjaCBhZnRlciBmdWxsIGZzdmVyaXR5
IHN1cHBvcnQuCgpSZXZpZXdlZC1ieTogRGFycmljayBKLiBXb25nIDxkandvbmdAa2VybmVsLm9y
Zz4KUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgpTaWduZWQtb2Zm
LWJ5OiBBbmRyZXkgQWxiZXJzaHRleW4gPGFhbGJlcnNoQGtlcm5lbC5vcmc+Ci0tLQogZnMveGZz
L2xpYnhmcy94ZnNfZm9ybWF0LmggICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystCiBmcy94ZnMvbGlieGZzL3hmc19pbm9kZV9idWYuYyAgfCAgOCArKysrKysrKwogZnMveGZz
L2xpYnhmcy94ZnNfaW5vZGVfdXRpbC5jIHwgIDIgKysKIGZzL3hmcy9saWJ4ZnMveGZzX3NiLmMg
ICAgICAgICB8ICAyICsrCiBmcy94ZnMveGZzX2lvcHMuYyAgICAgICAgICAgICAgfCAgMiArKwog
ZnMveGZzL3hmc19tb3VudC5oICAgICAgICAgICAgIHwgIDIgKysKIDYgZmlsZXMgY2hhbmdlZCwg
NDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2ZzL3hmcy9saWJ4
ZnMveGZzX2Zvcm1hdC5oIGIvZnMveGZzL2xpYnhmcy94ZnNfZm9ybWF0LmgKaW5kZXggNzc5ZGFj
NTliMWYzLi40ZGZmMjk2NTllNDAgMTAwNjQ0Ci0tLSBhL2ZzL3hmcy9saWJ4ZnMveGZzX2Zvcm1h
dC5oCisrKyBiL2ZzL3hmcy9saWJ4ZnMveGZzX2Zvcm1hdC5oCkBAIC0zNzQsNiArMzc0LDcgQEAg
eGZzX3NiX2hhc19jb21wYXRfZmVhdHVyZSgKICNkZWZpbmUgWEZTX1NCX0ZFQVRfUk9fQ09NUEFU
X1JNQVBCVCAgICgxIDw8IDEpCQkvKiByZXZlcnNlIG1hcCBidHJlZSAqLwogI2RlZmluZSBYRlNf
U0JfRkVBVF9ST19DT01QQVRfUkVGTElOSyAgKDEgPDwgMikJCS8qIHJlZmxpbmtlZCBmaWxlcyAq
LwogI2RlZmluZSBYRlNfU0JfRkVBVF9ST19DT01QQVRfSU5PQlRDTlQgKDEgPDwgMykJCS8qIGlu
b2J0IGJsb2NrIGNvdW50cyAqLworI2RlZmluZSBYRlNfU0JfRkVBVF9ST19DT01QQVRfVkVSSVRZ
ICAgKDEgPDwgNCkJCS8qIGZzLXZlcml0eSAqLwogI2RlZmluZSBYRlNfU0JfRkVBVF9ST19DT01Q
QVRfQUxMIFwKIAkJKFhGU19TQl9GRUFUX1JPX0NPTVBBVF9GSU5PQlQgfCBcCiAJCSBYRlNfU0Jf
RkVBVF9ST19DT01QQVRfUk1BUEJUIHwgXApAQCAtMTIzMCwxNiArMTIzMSwyMSBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgeGZzX2Rpbm9kZV9wdXRfcmRldihzdHJ1Y3QgeGZzX2Rpbm9kZSAqZGlwLCB4
ZnNfZGV2X3QgcmRldikKICAqLwogI2RlZmluZSBYRlNfRElGTEFHMl9NRVRBREFUQV9CSVQJNQog
CisvKiBpbm9kZXMgc2VhbGVkIHdpdGggZnMtdmVyaXR5ICovCisjZGVmaW5lIFhGU19ESUZMQUcy
X1ZFUklUWV9CSVQJCTYKKwogI2RlZmluZSBYRlNfRElGTEFHMl9EQVgJCSgxVUxMIDw8IFhGU19E
SUZMQUcyX0RBWF9CSVQpCiAjZGVmaW5lIFhGU19ESUZMQUcyX1JFRkxJTksJKDFVTEwgPDwgWEZT
X0RJRkxBRzJfUkVGTElOS19CSVQpCiAjZGVmaW5lIFhGU19ESUZMQUcyX0NPV0VYVFNJWkUJKDFV
TEwgPDwgWEZTX0RJRkxBRzJfQ09XRVhUU0laRV9CSVQpCiAjZGVmaW5lIFhGU19ESUZMQUcyX0JJ
R1RJTUUJKDFVTEwgPDwgWEZTX0RJRkxBRzJfQklHVElNRV9CSVQpCiAjZGVmaW5lIFhGU19ESUZM
QUcyX05SRVhUNjQJKDFVTEwgPDwgWEZTX0RJRkxBRzJfTlJFWFQ2NF9CSVQpCiAjZGVmaW5lIFhG
U19ESUZMQUcyX01FVEFEQVRBCSgxVUxMIDw8IFhGU19ESUZMQUcyX01FVEFEQVRBX0JJVCkKKyNk
ZWZpbmUgWEZTX0RJRkxBRzJfVkVSSVRZCSgxVUxMIDw8IFhGU19ESUZMQUcyX1ZFUklUWV9CSVQp
CiAKICNkZWZpbmUgWEZTX0RJRkxBRzJfQU5ZIFwKIAkoWEZTX0RJRkxBRzJfREFYIHwgWEZTX0RJ
RkxBRzJfUkVGTElOSyB8IFhGU19ESUZMQUcyX0NPV0VYVFNJWkUgfCBcCi0JIFhGU19ESUZMQUcy
X0JJR1RJTUUgfCBYRlNfRElGTEFHMl9OUkVYVDY0IHwgWEZTX0RJRkxBRzJfTUVUQURBVEEpCisJ
IFhGU19ESUZMQUcyX0JJR1RJTUUgfCBYRlNfRElGTEFHMl9OUkVYVDY0IHwgWEZTX0RJRkxBRzJf
TUVUQURBVEEgfCBcCisJIFhGU19ESUZMQUcyX1ZFUklUWSkKIAogc3RhdGljIGlubGluZSBib29s
IHhmc19kaW5vZGVfaGFzX2JpZ3RpbWUoY29uc3Qgc3RydWN0IHhmc19kaW5vZGUgKmRpcCkKIHsK
QEAgLTIwMjEsNCArMjAyNywyNiBAQCBzdHJ1Y3QgeGZzX2FjbCB7CiAjZGVmaW5lIFNHSV9BQ0xf
RklMRV9TSVpFCShzaXplb2YoU0dJX0FDTF9GSUxFKS0xKQogI2RlZmluZSBTR0lfQUNMX0RFRkFV
TFRfU0laRQkoc2l6ZW9mKFNHSV9BQ0xfREVGQVVMVCktMSkKIAorLyoKKyAqIEF0IG1heGltdW0g
b2YgOCBsZXZlbHMgd2l0aCAxMjggaGFzaGVzIHBlciBibG9jayAoMzIgYnl0ZXMgU0hBLTI1Nikg
bWF4aW11bQorICogdHJlZSBzaXplIGlzICgoMTI4Xjgg4oiSIDEpLygxMjgg4oiSIDEpKSA9IDU2
NyoxMF4xMiBibG9ja3MuIFRoaXMgc2hvdWxkIGZpdCBpbgorICogNTMgYml0cyBhZGRyZXNzIHNw
YWNlLgorICoKKyAqIEF0IHRoaXMgTWVya2xlIHRyZWUgc2l6ZSB3ZSBjYW4gY292ZXIgMjk1RUIg
bGFyZ2UgZmlsZS4gVGhpcyBpcyBtdWNoIGxhcmdlcgorICogdGhhbiB0aGUgY3VycmVudGx5IHN1
cHBvcnRlZCBmaWxlIHNpemUuCisgKgorICogRm9yIHNoYTUxMiB0aGUgbGFyZ2VzdCBmaWxlIHdl
IGNhbiBjb3ZlciBlbmRzIGF0IDEgPDwgNTAgb2Zmc2V0LCB0aGlzIGlzIGFsc28KKyAqIGdvb2Qu
CisgKi8KKyNkZWZpbmUgWEZTX0ZTVkVSSVRZX0xBUkdFU1RfRklMRQkoKGxvZmZfdCkxVUxMIDw8
IDUzKQorCisvKgorICogQWxpZ25tZW50IG9mIHRoZSBmc3Zlcml0eSBtZXRhZGF0YSBwbGFjZW1l
bnQuIFRoaXMgaXMgbGFyZ2VzdCBzdXBwb3J0ZWQgUEFHRQorICogU0laRSBmb3IgZnN2ZXJpdHku
IFRoaXMgaXMgdXNlZCB0byBzcGFjZSBvdXQgZGF0YSBhbmQgbWV0YWRhdGEgaW4gcGFnZSBjYWNo
ZS4KKyAqIFRoZSBzcGFjaW5nIGlzIG5lY2Vzc2FyeSBmb3Igbm9uLWV4cG9zdXJlIG9mIG1ldGFk
YXRhIHRvIHVzZXJzcGFjZSBhbmQKKyAqIGNvcnJlY3QgbWVya2xlIHRyZWUgc3luZXRoZXNpcyBp
biB0aGUgaW9tYXAuCisgKi8KKyNkZWZpbmUgWEZTX0ZTVkVSSVRZX1NUQVJUX0FMSUdOCSg2NTUz
NikKKworCiAjZW5kaWYgLyogX19YRlNfRk9STUFUX0hfXyAqLwpkaWZmIC0tZ2l0IGEvZnMveGZz
L2xpYnhmcy94ZnNfaW5vZGVfYnVmLmMgYi9mcy94ZnMvbGlieGZzL3hmc19pbm9kZV9idWYuYwpp
bmRleCAzNzk0ZTU0MTJlYmEuLmYyMTgxYzFiZWQ1NCAxMDA2NDQKLS0tIGEvZnMveGZzL2xpYnhm
cy94ZnNfaW5vZGVfYnVmLmMKKysrIGIvZnMveGZzL2xpYnhmcy94ZnNfaW5vZGVfYnVmLmMKQEAg
LTc2MCw2ICs3NjAsMTQgQEAgeGZzX2Rpbm9kZV92ZXJpZnkoCiAJICAgICF4ZnNfaGFzX3J0cmVm
bGluayhtcCkpCiAJCXJldHVybiBfX3RoaXNfYWRkcmVzczsKIAorCS8qIG9ubHkgcmVndWxhciBm
aWxlcyBjYW4gaGF2ZSBmc3Zlcml0eSAqLworCWlmIChmbGFnczIgJiBYRlNfRElGTEFHMl9WRVJJ
VFkpIHsKKwkJaWYgKCF4ZnNfaGFzX3Zlcml0eShtcCkpCisJCQlyZXR1cm4gX190aGlzX2FkZHJl
c3M7CisJCWlmICghU19JU1JFRyhtb2RlKSkKKwkJCXJldHVybiBfX3RoaXNfYWRkcmVzczsKKwl9
CisKIAlpZiAoeGZzX2hhc196b25lZChtcCkgJiYKIAkgICAgZGlwLT5kaV9tZXRhdHlwZSA9PSBj
cHVfdG9fYmUxNihYRlNfTUVUQUZJTEVfUlRSTUFQKSkgewogCQlpZiAoYmUzMl90b19jcHUoZGlw
LT5kaV91c2VkX2Jsb2NrcykgPiBtcC0+bV9zYi5zYl9yZ2V4dGVudHMpCmRpZmYgLS1naXQgYS9m
cy94ZnMvbGlieGZzL3hmc19pbm9kZV91dGlsLmMgYi9mcy94ZnMvbGlieGZzL3hmc19pbm9kZV91
dGlsLmMKaW5kZXggNTUxZmE1MWJlZmI2Li42YjFlMjBhNGJiOWIgMTAwNjQ0Ci0tLSBhL2ZzL3hm
cy9saWJ4ZnMveGZzX2lub2RlX3V0aWwuYworKysgYi9mcy94ZnMvbGlieGZzL3hmc19pbm9kZV91
dGlsLmMKQEAgLTEyNiw2ICsxMjYsOCBAQCB4ZnNfaXAyeGZsYWdzKAogCQkJZmxhZ3MgfD0gRlNf
WEZMQUdfREFYOwogCQlpZiAoaXAtPmlfZGlmbGFnczIgJiBYRlNfRElGTEFHMl9DT1dFWFRTSVpF
KQogCQkJZmxhZ3MgfD0gRlNfWEZMQUdfQ09XRVhUU0laRTsKKwkJaWYgKGlwLT5pX2RpZmxhZ3My
ICYgWEZTX0RJRkxBRzJfVkVSSVRZKQorCQkJZmxhZ3MgfD0gRlNfWEZMQUdfVkVSSVRZOwogCX0K
IAogCWlmICh4ZnNfaW5vZGVfaGFzX2F0dHJfZm9yayhpcCkpCmRpZmYgLS1naXQgYS9mcy94ZnMv
bGlieGZzL3hmc19zYi5jIGIvZnMveGZzL2xpYnhmcy94ZnNfc2IuYwppbmRleCA0NzMyMmFkYjc2
OTAuLmExNTUxMGViZDJmMSAxMDA2NDQKLS0tIGEvZnMveGZzL2xpYnhmcy94ZnNfc2IuYworKysg
Yi9mcy94ZnMvbGlieGZzL3hmc19zYi5jCkBAIC0xNjUsNiArMTY1LDggQEAgeGZzX3NiX3ZlcnNp
b25fdG9fZmVhdHVyZXMoCiAJCWZlYXR1cmVzIHw9IFhGU19GRUFUX1JFRkxJTks7CiAJaWYgKHNi
cC0+c2JfZmVhdHVyZXNfcm9fY29tcGF0ICYgWEZTX1NCX0ZFQVRfUk9fQ09NUEFUX0lOT0JUQ05U
KQogCQlmZWF0dXJlcyB8PSBYRlNfRkVBVF9JTk9CVENOVDsKKwlpZiAoc2JwLT5zYl9mZWF0dXJl
c19yb19jb21wYXQgJiBYRlNfU0JfRkVBVF9ST19DT01QQVRfVkVSSVRZKQorCQlmZWF0dXJlcyB8
PSBYRlNfRkVBVF9WRVJJVFk7CiAJaWYgKHNicC0+c2JfZmVhdHVyZXNfaW5jb21wYXQgJiBYRlNf
U0JfRkVBVF9JTkNPTVBBVF9GVFlQRSkKIAkJZmVhdHVyZXMgfD0gWEZTX0ZFQVRfRlRZUEU7CiAJ
aWYgKHNicC0+c2JfZmVhdHVyZXNfaW5jb21wYXQgJiBYRlNfU0JfRkVBVF9JTkNPTVBBVF9TUElO
T0RFUykKZGlmZiAtLWdpdCBhL2ZzL3hmcy94ZnNfaW9wcy5jIGIvZnMveGZzL3hmc19pb3BzLmMK
aW5kZXggMzI1YzIyMDBjNTAxLi4yNWM2ZTFkMDhjZGMgMTAwNjQ0Ci0tLSBhL2ZzL3hmcy94ZnNf
aW9wcy5jCisrKyBiL2ZzL3hmcy94ZnNfaW9wcy5jCkBAIC0xMzk4LDYgKzEzOTgsOCBAQCB4ZnNf
ZGlmbGFnc190b19pZmxhZ3MoCiAJCWZsYWdzIHw9IFNfTk9BVElNRTsKIAlpZiAoaW5pdCAmJiB4
ZnNfaW5vZGVfc2hvdWxkX2VuYWJsZV9kYXgoaXApKQogCQlmbGFncyB8PSBTX0RBWDsKKwlpZiAo
eGZsYWdzICYgRlNfWEZMQUdfVkVSSVRZKQorCQlmbGFncyB8PSBTX1ZFUklUWTsKIAogCS8qCiAJ
ICogU19EQVggY2FuIG9ubHkgYmUgc2V0IGR1cmluZyBpbm9kZSBpbml0aWFsaXphdGlvbiBhbmQg
aXMgbmV2ZXIgc2V0IGJ5CmRpZmYgLS1naXQgYS9mcy94ZnMveGZzX21vdW50LmggYi9mcy94ZnMv
eGZzX21vdW50LmgKaW5kZXggZDk2NGJhZTA5NmVmLi4yYzA2Nzc4YTQwNGEgMTAwNjQ0Ci0tLSBh
L2ZzL3hmcy94ZnNfbW91bnQuaAorKysgYi9mcy94ZnMveGZzX21vdW50LmgKQEAgLTM4OCw2ICsz
ODgsNyBAQCB0eXBlZGVmIHN0cnVjdCB4ZnNfbW91bnQgewogI2RlZmluZSBYRlNfRkVBVF9FWENI
QU5HRV9SQU5HRQkoMVVMTCA8PCAyNykJLyogZXhjaGFuZ2UgcmFuZ2UgKi8KICNkZWZpbmUgWEZT
X0ZFQVRfTUVUQURJUgkoMVVMTCA8PCAyOCkJLyogbWV0YWRhdGEgZGlyZWN0b3J5IHRyZWUgKi8K
ICNkZWZpbmUgWEZTX0ZFQVRfWk9ORUQJCSgxVUxMIDw8IDI5KQkvKiB6b25lZCBSVCBkZXZpY2Ug
Ki8KKyNkZWZpbmUgWEZTX0ZFQVRfVkVSSVRZCQkoMVVMTCA8PCAzMCkJLyogZnMtdmVyaXR5ICov
CiAKIC8qIE1vdW50IGZlYXR1cmVzICovCiAjZGVmaW5lIFhGU19GRUFUX05PTElGRVRJTUUJKDFV
TEwgPDwgNDcpCS8qIGRpc2FibGUgbGlmZXRpbWUgaGludHMgKi8KQEAgLTQ0NSw2ICs0NDYsNyBA
QCBfX1hGU19IQVNfRkVBVChleGNoYW5nZV9yYW5nZSwgRVhDSEFOR0VfUkFOR0UpCiBfX1hGU19I
QVNfRkVBVChtZXRhZGlyLCBNRVRBRElSKQogX19YRlNfSEFTX0ZFQVQoem9uZWQsIFpPTkVEKQog
X19YRlNfSEFTX0ZFQVQobm9saWZldGltZSwgTk9MSUZFVElNRSkKK19fWEZTX0hBU19GRUFUKHZl
cml0eSwgVkVSSVRZKQogCiBzdGF0aWMgaW5saW5lIGJvb2wgeGZzX2hhc19ydGdyb3Vwcyhjb25z
dCBzdHJ1Y3QgeGZzX21vdW50ICptcCkKIHsKLS0gCjIuNTEuMgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
