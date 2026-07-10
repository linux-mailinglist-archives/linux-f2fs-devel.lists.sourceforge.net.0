Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8m31LiuzUGqV3gIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 10:54:03 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F231738B22
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 10:54:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Gg0EjQyY;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=fZ65zOxz;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Ts7VJ5WR;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=PmtHHt5K;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9ivmce9g1Y6qCYJ4g/jFQH/xDcbbsJpt+S/Q7mC4TE=; b=Gg0EjQyYy1Xr8PG8eSW//wpbvo
	pp0JXeK0f4YEOqivOm3sQ9UtNHvBrmoW0YmwruZNORoLhfaxmtfXMNLtaQ3WYOKns6cWR6KxrLkLG
	ffxyCRB4wmWzZ8PfIo1GkZQVD+IVuHK5ZSLhrrBbybX6p7WCtcaS6neRRI9cfsKw3AaA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wi6zg-0003QV-4W;
	Fri, 10 Jul 2026 08:54:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1wi6zc-0003Pu-9E
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 08:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kL8VGnh7ljhPkiDmZ9sLKlAncJEgXPbXDH7MRlFFQLA=; b=fZ65zOxzVQ4OpOqZ7Ntn+VTQLi
 Z3AWztuCO0Gn3IGtEHb5+hciLEa8+Sb3Wpf8YuZHVWTabKDrf09wLIayXlUy75CSjaZ+AVlckGh7j
 yj4gVE7DJyZAGXnnWY+0TjPiGv5aLLbX2dg3LzsGSouFrNxN2ajNRG6Q7GWZZnT/o2ew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kL8VGnh7ljhPkiDmZ9sLKlAncJEgXPbXDH7MRlFFQLA=; b=Ts7VJ5WR+NTuVeMItt8RYCrXui
 i1d0etLDEGOh0Ec//4N5xi3rpTXo3xJh37r7pMDGjOLX+tqq7d/qqRamgXs+fbr6vYIawdXTx4u6B
 0/Q0jAX79aL+OSR3dzZj+633kbVZLff/Jhp1vePqn1tkg69jy95kjUyrHOvits6aqotU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wi6zc-0007UT-BL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 08:53:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C4329600C3;
 Fri, 10 Jul 2026 08:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1611F000E9;
 Fri, 10 Jul 2026 08:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783673625;
 bh=kL8VGnh7ljhPkiDmZ9sLKlAncJEgXPbXDH7MRlFFQLA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PmtHHt5Ky2Hkb0lTfstKPPBvjw6CoVk36I64uGxTtYkfiy9hqaBb7HkTgbf10GEki
 pmSeMhenJQozUO7KhLO5eFZ9CpsMqDZDV2e4ajWXrMQkqjK/6HIs+K8hB7jWpdOpiG
 cz+WFzluv7m02Nx9WVmi7Xgv4PE8pAxOd7y20trTYXkT6PUI5Ebhqz/Eq/I9dfRDVD
 bmL3PS5YfdEunfKUKslAYKKBalCY6Gi5tcgdintiL4+KH2iAyllhvpKSuwrsKf0+PW
 /s0WPdEhh/AntbuiJdHFpo62xgMguox+GKhHIGG3ZluazFvM+1qumPjscm8wIcR3E6
 nxhmpgb9cpWZw==
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Date: Fri, 10 Jul 2026 10:52:35 +0200
Message-ID: <20260710085256.3464201-8-aalbersh@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710085256.3464201-1-aalbersh@kernel.org>
References: <20260710085256.3464201-1-aalbersh@kernel.org>
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wi6zc-0007UT-BL
Subject: [f2fs-dev] [PATCH v11 07/20] xfs: introduce fsverity on-disk changes
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
X-Rspamd-Action: no action
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-xfs@vger.kernel.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
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
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lst.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F231738B22

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
L2xpYnhmcy94ZnNfaW5vZGVfdXRpbC5jIHwgIDUgKysrKy0KIGZzL3hmcy9saWJ4ZnMveGZzX3Ni
LmMgICAgICAgICB8ICAyICsrCiBmcy94ZnMveGZzX2lvcHMuYyAgICAgICAgICAgICAgfCAgNSAr
KysrLQogZnMveGZzL3hmc19tb3VudC5oICAgICAgICAgICAgIHwgIDIgKysKIDYgZmlsZXMgY2hh
bmdlZCwgNDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy94
ZnMvbGlieGZzL3hmc19mb3JtYXQuaCBiL2ZzL3hmcy9saWJ4ZnMveGZzX2Zvcm1hdC5oCmluZGV4
IGRkMGVkMDQ2ZmJlOS4uN2IwNTExZWIwM2QwIDEwMDY0NAotLS0gYS9mcy94ZnMvbGlieGZzL3hm
c19mb3JtYXQuaAorKysgYi9mcy94ZnMvbGlieGZzL3hmc19mb3JtYXQuaApAQCAtMzc0LDYgKzM3
NCw3IEBAIHhmc19zYl9oYXNfY29tcGF0X2ZlYXR1cmUoCiAjZGVmaW5lIFhGU19TQl9GRUFUX1JP
X0NPTVBBVF9STUFQQlQgICAoMSA8PCAxKQkJLyogcmV2ZXJzZSBtYXAgYnRyZWUgKi8KICNkZWZp
bmUgWEZTX1NCX0ZFQVRfUk9fQ09NUEFUX1JFRkxJTksgICgxIDw8IDIpCQkvKiByZWZsaW5rZWQg
ZmlsZXMgKi8KICNkZWZpbmUgWEZTX1NCX0ZFQVRfUk9fQ09NUEFUX0lOT0JUQ05UICgxIDw8IDMp
CQkvKiBpbm9idCBibG9jayBjb3VudHMgKi8KKyNkZWZpbmUgWEZTX1NCX0ZFQVRfUk9fQ09NUEFU
X1ZFUklUWSAgICgxIDw8IDQpCQkvKiBmcy12ZXJpdHkgKi8KICNkZWZpbmUgWEZTX1NCX0ZFQVRf
Uk9fQ09NUEFUX0FMTCBcCiAJCShYRlNfU0JfRkVBVF9ST19DT01QQVRfRklOT0JUIHwgXAogCQkg
WEZTX1NCX0ZFQVRfUk9fQ09NUEFUX1JNQVBCVCB8IFwKQEAgLTEyMzAsMTYgKzEyMzEsMjEgQEAg
c3RhdGljIGlubGluZSB2b2lkIHhmc19kaW5vZGVfcHV0X3JkZXYoc3RydWN0IHhmc19kaW5vZGUg
KmRpcCwgeGZzX2Rldl90IHJkZXYpCiAgKi8KICNkZWZpbmUgWEZTX0RJRkxBRzJfTUVUQURBVEFf
QklUCTUKIAorLyogaW5vZGVzIHNlYWxlZCB3aXRoIGZzLXZlcml0eSAqLworI2RlZmluZSBYRlNf
RElGTEFHMl9WRVJJVFlfQklUCQk2CisKICNkZWZpbmUgWEZTX0RJRkxBRzJfREFYCQkoMVVMTCA8
PCBYRlNfRElGTEFHMl9EQVhfQklUKQogI2RlZmluZSBYRlNfRElGTEFHMl9SRUZMSU5LCSgxVUxM
IDw8IFhGU19ESUZMQUcyX1JFRkxJTktfQklUKQogI2RlZmluZSBYRlNfRElGTEFHMl9DT1dFWFRT
SVpFCSgxVUxMIDw8IFhGU19ESUZMQUcyX0NPV0VYVFNJWkVfQklUKQogI2RlZmluZSBYRlNfRElG
TEFHMl9CSUdUSU1FCSgxVUxMIDw8IFhGU19ESUZMQUcyX0JJR1RJTUVfQklUKQogI2RlZmluZSBY
RlNfRElGTEFHMl9OUkVYVDY0CSgxVUxMIDw8IFhGU19ESUZMQUcyX05SRVhUNjRfQklUKQogI2Rl
ZmluZSBYRlNfRElGTEFHMl9NRVRBREFUQQkoMVVMTCA8PCBYRlNfRElGTEFHMl9NRVRBREFUQV9C
SVQpCisjZGVmaW5lIFhGU19ESUZMQUcyX1ZFUklUWQkoMVVMTCA8PCBYRlNfRElGTEFHMl9WRVJJ
VFlfQklUKQogCiAjZGVmaW5lIFhGU19ESUZMQUcyX0FOWSBcCiAJKFhGU19ESUZMQUcyX0RBWCB8
IFhGU19ESUZMQUcyX1JFRkxJTksgfCBYRlNfRElGTEFHMl9DT1dFWFRTSVpFIHwgXAotCSBYRlNf
RElGTEFHMl9CSUdUSU1FIHwgWEZTX0RJRkxBRzJfTlJFWFQ2NCB8IFhGU19ESUZMQUcyX01FVEFE
QVRBKQorCSBYRlNfRElGTEFHMl9CSUdUSU1FIHwgWEZTX0RJRkxBRzJfTlJFWFQ2NCB8IFhGU19E
SUZMQUcyX01FVEFEQVRBIHwgXAorCSBYRlNfRElGTEFHMl9WRVJJVFkpCiAKIHN0YXRpYyBpbmxp
bmUgYm9vbCB4ZnNfZGlub2RlX2hhc19iaWd0aW1lKGNvbnN0IHN0cnVjdCB4ZnNfZGlub2RlICpk
aXApCiB7CkBAIC0yMDI3LDQgKzIwMzMsMjYgQEAgc3RydWN0IHhmc19hY2wgewogI2RlZmluZSBT
R0lfQUNMX0ZJTEVfU0laRQkoc2l6ZW9mKFNHSV9BQ0xfRklMRSktMSkKICNkZWZpbmUgU0dJX0FD
TF9ERUZBVUxUX1NJWkUJKHNpemVvZihTR0lfQUNMX0RFRkFVTFQpLTEpCiAKKy8qCisgKiBBdCBt
YXhpbXVtIG9mIDggbGV2ZWxzIHdpdGggMTI4IGhhc2hlcyBwZXIgYmxvY2sgKDMyIGJ5dGVzIFNI
QS0yNTYpIG1heGltdW0KKyAqIHRyZWUgc2l6ZSBpcyAoKDEyOF44IOKIkiAxKS8oMTI4IOKIkiAx
KSkgPSA1NjcqMTBeMTIgYmxvY2tzLiBUaGlzIHNob3VsZCBmaXQgaW4KKyAqIDUzIGJpdHMgYWRk
cmVzcyBzcGFjZS4KKyAqCisgKiBBdCB0aGlzIE1lcmtsZSB0cmVlIHNpemUgd2UgY2FuIGNvdmVy
IDI5NUVCIGxhcmdlIGZpbGUuIFRoaXMgaXMgbXVjaCBsYXJnZXIKKyAqIHRoYW4gdGhlIGN1cnJl
bnRseSBzdXBwb3J0ZWQgZmlsZSBzaXplLgorICoKKyAqIEZvciBzaGE1MTIgdGhlIGxhcmdlc3Qg
ZmlsZSB3ZSBjYW4gY292ZXIgZW5kcyBhdCAxIDw8IDUwIG9mZnNldCwgdGhpcyBpcyBhbHNvCisg
KiBnb29kLgorICovCisjZGVmaW5lIFhGU19GU1ZFUklUWV9MQVJHRVNUX0ZJTEUJKChsb2ZmX3Qp
MVVMTCA8PCA1MykKKworLyoKKyAqIEFsaWdubWVudCBvZiB0aGUgZnN2ZXJpdHkgbWV0YWRhdGEg
cGxhY2VtZW50LiBUaGlzIGlzIGxhcmdlc3Qgc3VwcG9ydGVkIFBBR0UKKyAqIFNJWkUgZm9yIGZz
dmVyaXR5LiBUaGlzIGlzIHVzZWQgdG8gc3BhY2Ugb3V0IGRhdGEgYW5kIG1ldGFkYXRhIGluIHBh
Z2UgY2FjaGUuCisgKiBUaGUgc3BhY2luZyBpcyBuZWNlc3NhcnkgZm9yIG5vbi1leHBvc3VyZSBv
ZiBtZXRhZGF0YSB0byB1c2Vyc3BhY2UgYW5kCisgKiBjb3JyZWN0IG1lcmtsZSB0cmVlIHN5bmV0
aGVzaXMgaW4gdGhlIGlvbWFwLgorICovCisjZGVmaW5lIFhGU19GU1ZFUklUWV9TVEFSVF9BTElH
TgkoNjU1MzYpCisKKwogI2VuZGlmIC8qIF9fWEZTX0ZPUk1BVF9IX18gKi8KZGlmZiAtLWdpdCBh
L2ZzL3hmcy9saWJ4ZnMveGZzX2lub2RlX2J1Zi5jIGIvZnMveGZzL2xpYnhmcy94ZnNfaW5vZGVf
YnVmLmMKaW5kZXggMzM2ZWY4NDNmMmZlLi5iZDgwYTE5ZjJlMDkgMTAwNjQ0Ci0tLSBhL2ZzL3hm
cy9saWJ4ZnMveGZzX2lub2RlX2J1Zi5jCisrKyBiL2ZzL3hmcy9saWJ4ZnMveGZzX2lub2RlX2J1
Zi5jCkBAIC03NjAsNiArNzYwLDE0IEBAIHhmc19kaW5vZGVfdmVyaWZ5KAogCSAgICAheGZzX2hh
c19ydHJlZmxpbmsobXApKQogCQlyZXR1cm4gX190aGlzX2FkZHJlc3M7CiAKKwkvKiBvbmx5IHJl
Z3VsYXIgZmlsZXMgY2FuIGhhdmUgZnN2ZXJpdHkgKi8KKwlpZiAoZmxhZ3MyICYgWEZTX0RJRkxB
RzJfVkVSSVRZKSB7CisJCWlmICgheGZzX2hhc192ZXJpdHkobXApKQorCQkJcmV0dXJuIF9fdGhp
c19hZGRyZXNzOworCQlpZiAoIVNfSVNSRUcobW9kZSkpCisJCQlyZXR1cm4gX190aGlzX2FkZHJl
c3M7CisJfQorCiAJaWYgKHhmc19oYXNfem9uZWQobXApICYmCiAJICAgIGRpcC0+ZGlfbWV0YXR5
cGUgPT0gY3B1X3RvX2JlMTYoWEZTX01FVEFGSUxFX1JUUk1BUCkpIHsKIAkJaWYgKGJlMzJfdG9f
Y3B1KGRpcC0+ZGlfdXNlZF9ibG9ja3MpID4gbXAtPm1fc2Iuc2JfcmdleHRlbnRzKQpkaWZmIC0t
Z2l0IGEvZnMveGZzL2xpYnhmcy94ZnNfaW5vZGVfdXRpbC5jIGIvZnMveGZzL2xpYnhmcy94ZnNf
aW5vZGVfdXRpbC5jCmluZGV4IDI1OGFjM2QwZDQ4Ni4uNWE1MTZiZDMxYzMxIDEwMDY0NAotLS0g
YS9mcy94ZnMvbGlieGZzL3hmc19pbm9kZV91dGlsLmMKKysrIGIvZnMveGZzL2xpYnhmcy94ZnNf
aW5vZGVfdXRpbC5jCkBAIC03NCw3ICs3NCw4IEBAIHhmc19mbGFnczJkaWZsYWdzMigKIAl1aW50
NjRfdAkJZGlfZmxhZ3MyID0KIAkJKGlwLT5pX2RpZmxhZ3MyICYgKFhGU19ESUZMQUcyX1JFRkxJ
TksgfAogCQkJCSAgIFhGU19ESUZMQUcyX0JJR1RJTUUgfAotCQkJCSAgIFhGU19ESUZMQUcyX05S
RVhUNjQpKTsKKwkJCQkgICBYRlNfRElGTEFHMl9OUkVYVDY0IHwKKwkJCQkgICBYRlNfRElGTEFH
Ml9WRVJJVFkpKTsKIAogCWlmICh4ZmxhZ3MgJiBGU19YRkxBR19EQVgpCiAJCWRpX2ZsYWdzMiB8
PSBYRlNfRElGTEFHMl9EQVg7CkBAIC0xMjYsNiArMTI3LDggQEAgeGZzX2lwMnhmbGFncygKIAkJ
CWZsYWdzIHw9IEZTX1hGTEFHX0RBWDsKIAkJaWYgKGlwLT5pX2RpZmxhZ3MyICYgWEZTX0RJRkxB
RzJfQ09XRVhUU0laRSkKIAkJCWZsYWdzIHw9IEZTX1hGTEFHX0NPV0VYVFNJWkU7CisJCWlmIChp
cC0+aV9kaWZsYWdzMiAmIFhGU19ESUZMQUcyX1ZFUklUWSkKKwkJCWZsYWdzIHw9IEZTX1hGTEFH
X1ZFUklUWTsKIAl9CiAKIAlpZiAoeGZzX2lub2RlX2hhc19hdHRyX2ZvcmsoaXApKQpkaWZmIC0t
Z2l0IGEvZnMveGZzL2xpYnhmcy94ZnNfc2IuYyBiL2ZzL3hmcy9saWJ4ZnMveGZzX3NiLmMKaW5k
ZXggNDczMjJhZGI3NjkwLi5hMTU1MTBlYmQyZjEgMTAwNjQ0Ci0tLSBhL2ZzL3hmcy9saWJ4ZnMv
eGZzX3NiLmMKKysrIGIvZnMveGZzL2xpYnhmcy94ZnNfc2IuYwpAQCAtMTY1LDYgKzE2NSw4IEBA
IHhmc19zYl92ZXJzaW9uX3RvX2ZlYXR1cmVzKAogCQlmZWF0dXJlcyB8PSBYRlNfRkVBVF9SRUZM
SU5LOwogCWlmIChzYnAtPnNiX2ZlYXR1cmVzX3JvX2NvbXBhdCAmIFhGU19TQl9GRUFUX1JPX0NP
TVBBVF9JTk9CVENOVCkKIAkJZmVhdHVyZXMgfD0gWEZTX0ZFQVRfSU5PQlRDTlQ7CisJaWYgKHNi
cC0+c2JfZmVhdHVyZXNfcm9fY29tcGF0ICYgWEZTX1NCX0ZFQVRfUk9fQ09NUEFUX1ZFUklUWSkK
KwkJZmVhdHVyZXMgfD0gWEZTX0ZFQVRfVkVSSVRZOwogCWlmIChzYnAtPnNiX2ZlYXR1cmVzX2lu
Y29tcGF0ICYgWEZTX1NCX0ZFQVRfSU5DT01QQVRfRlRZUEUpCiAJCWZlYXR1cmVzIHw9IFhGU19G
RUFUX0ZUWVBFOwogCWlmIChzYnAtPnNiX2ZlYXR1cmVzX2luY29tcGF0ICYgWEZTX1NCX0ZFQVRf
SU5DT01QQVRfU1BJTk9ERVMpCmRpZmYgLS1naXQgYS9mcy94ZnMveGZzX2lvcHMuYyBiL2ZzL3hm
cy94ZnNfaW9wcy5jCmluZGV4IDYzMzlmNDk1NmVjYi4uMTFkYzFhNDg1Y2E3IDEwMDY0NAotLS0g
YS9mcy94ZnMveGZzX2lvcHMuYworKysgYi9mcy94ZnMveGZzX2lvcHMuYwpAQCAtMTM5OCwxMiAr
MTM5OCwxNSBAQCB4ZnNfZGlmbGFnc190b19pZmxhZ3MoCiAJCWZsYWdzIHw9IFNfTk9BVElNRTsK
IAlpZiAoaW5pdCAmJiB4ZnNfaW5vZGVfc2hvdWxkX2VuYWJsZV9kYXgoaXApKQogCQlmbGFncyB8
PSBTX0RBWDsKKwlpZiAoeGZsYWdzICYgRlNfWEZMQUdfVkVSSVRZKQorCQlmbGFncyB8PSBTX1ZF
UklUWTsKIAogCS8qCiAJICogU19EQVggY2FuIG9ubHkgYmUgc2V0IGR1cmluZyBpbm9kZSBpbml0
aWFsaXphdGlvbiBhbmQgaXMgbmV2ZXIgc2V0IGJ5CiAJICogdGhlIFZGUywgc28gd2UgY2Fubm90
IG1hc2sgb2ZmIFNfREFYIGluIGlfZmxhZ3MuCiAJICovCi0JaW5vZGUtPmlfZmxhZ3MgJj0gfihT
X0lNTVVUQUJMRSB8IFNfQVBQRU5EIHwgU19TWU5DIHwgU19OT0FUSU1FKTsKKwlpbm9kZS0+aV9m
bGFncyAmPQorCQl+KFNfSU1NVVRBQkxFIHwgU19BUFBFTkQgfCBTX1NZTkMgfCBTX05PQVRJTUUg
fCBTX1ZFUklUWSk7CiAJaW5vZGUtPmlfZmxhZ3MgfD0gZmxhZ3M7CiB9CiAKZGlmZiAtLWdpdCBh
L2ZzL3hmcy94ZnNfbW91bnQuaCBiL2ZzL3hmcy94ZnNfbW91bnQuaAppbmRleCA2NmEwMmQxYjlh
ZDcuLjllZDdkMDkxMDkzZCAxMDA2NDQKLS0tIGEvZnMveGZzL3hmc19tb3VudC5oCisrKyBiL2Zz
L3hmcy94ZnNfbW91bnQuaApAQCAtMzg4LDYgKzM4OCw3IEBAIHR5cGVkZWYgc3RydWN0IHhmc19t
b3VudCB7CiAjZGVmaW5lIFhGU19GRUFUX0VYQ0hBTkdFX1JBTkdFCSgxVUxMIDw8IDI3KQkvKiBl
eGNoYW5nZSByYW5nZSAqLwogI2RlZmluZSBYRlNfRkVBVF9NRVRBRElSCSgxVUxMIDw8IDI4KQkv
KiBtZXRhZGF0YSBkaXJlY3RvcnkgdHJlZSAqLwogI2RlZmluZSBYRlNfRkVBVF9aT05FRAkJKDFV
TEwgPDwgMjkpCS8qIHpvbmVkIFJUIGRldmljZSAqLworI2RlZmluZSBYRlNfRkVBVF9WRVJJVFkJ
CSgxVUxMIDw8IDMwKQkvKiBmcy12ZXJpdHkgKi8KIAogLyogTW91bnQgZmVhdHVyZXMgKi8KICNk
ZWZpbmUgWEZTX0ZFQVRfTk9MSUZFVElNRQkoMVVMTCA8PCA0NykJLyogZGlzYWJsZSBsaWZldGlt
ZSBoaW50cyAqLwpAQCAtNDQ1LDYgKzQ0Niw3IEBAIF9fWEZTX0hBU19GRUFUKGV4Y2hhbmdlX3Jh
bmdlLCBFWENIQU5HRV9SQU5HRSkKIF9fWEZTX0hBU19GRUFUKG1ldGFkaXIsIE1FVEFESVIpCiBf
X1hGU19IQVNfRkVBVCh6b25lZCwgWk9ORUQpCiBfX1hGU19IQVNfRkVBVChub2xpZmV0aW1lLCBO
T0xJRkVUSU1FKQorX19YRlNfSEFTX0ZFQVQodmVyaXR5LCBWRVJJVFkpCiAKIHN0YXRpYyBpbmxp
bmUgYm9vbCB4ZnNfaGFzX3J0Z3JvdXBzKGNvbnN0IHN0cnVjdCB4ZnNfbW91bnQgKm1wKQogewot
LSAKMi41NC4wCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
