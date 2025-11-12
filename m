Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E93C4C52ABF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Nov 2025 15:21:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n9ygl3KzOsmltosPJGoltdPeDsIEh8/SD2us7meuQvc=; b=MNPget1CNGTQXj6OV2uIUt9gbv
	LQBYfLGpZ6gcNXYH5N2xcCSQepNKMGdVTpvRm4HD6nBf7JdYtqJzi0hxh96Efo/z9TJIiPH5q881L
	+Gi+ZUSKFMYndXR5PIoV9lcOna11+ZBps9azyzjBJ/eV6DakimNfDKtaSd71aM0gzXNE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vJBj0-000550-FD;
	Wed, 12 Nov 2025 14:21:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3HpEUaQsKAOEMRDQQHFKLHQJRRJOH.FRP@flex--joannechien.bounces.google.com>)
 id 1vJBih-00054g-3k for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Nov 2025 14:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:From:
 Subject:Message-ID:Mime-Version:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cAqmjbnFTx0PD1U3KZiXQZaIp+Ci7CPGA/Vlub4qq/c=; b=lWTQODU5DF1obhjHxnVm8MEc4Z
 pjHevMmNEOGuZ5oY/pAWc+Vy8ry5/Udh21g/G9L6LsE+k7sYh56IFRsem00fAtq6n2NJ8VWBlFaHE
 YbIZWqNxhqi6ZU4gNDj02gpll94nVhFb1gCgn0U8gg85W58KkGTulAPMJfYOtsKkuY44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cAqmjbnFTx0PD1U3KZiXQZaIp+Ci7CPGA/Vlub4qq/c=; b=a
 2qKhvdC/ogVzKCJu6agurhhRA3hbz6dhfSIXP+5yQnEEr0BSliU3mmtZuz7KwbJjKRTsxKcY4YVB/
 l6hVuf3t/t4jFMZ4rTU/pxLGcTsiLhhyAfMSlR9VEMVD2FH/dTadqZH9M1f6vFfdRvhzUS3SFuqda
 cIqN2xyZa2/AMSMo=;
Received: from mail-qk1-f202.google.com ([209.85.222.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vJBig-0001Y7-L3 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Nov 2025 14:21:10 +0000
Received: by mail-qk1-f202.google.com with SMTP id
 af79cd13be357-8b233e206ddso225108185a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Nov 2025 06:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762957260; x=1763562060;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cAqmjbnFTx0PD1U3KZiXQZaIp+Ci7CPGA/Vlub4qq/c=;
 b=2vXqGccsynXQ42pLakctKuzo04m4EfV+iFi7AdFdo7/i87UQixlt/GP8vPUqQ/g8KT
 G1AArndVzxCVxuAPzRdpE/Y8GLMksunevfjP2Sb9SOVZY6W1N9VUA0bTodAzrX9fw9AK
 +1/jk3osRHVwqSvceKO4hiyoIxIEyF9VnaIV/I3NJoyXN74WZL2MHyfEStD4ZuKO/TVo
 ea/t9hzrL9kQthLB9BtFs4ZyhXLgjCrMBX9JrjwuQulxxrkmLc+pZ6HUvXYexGISFrs3
 muNMiSR95qwEMdGnZfbCjd8UMyh4x3Ly9Pcz4G3WF/MoKFytKl7KNDg5FMo7Gyw1bewF
 J1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762957260; x=1763562060;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cAqmjbnFTx0PD1U3KZiXQZaIp+Ci7CPGA/Vlub4qq/c=;
 b=ajHmTrNyF4nEdaSGFBY5xtHHb9ticcGWGpABj7OD5TkBBT+zDlAePncuL8g83pa6iZ
 c780OU4/QMl3IPcTes49YVVL3prCSv+Bkzbs93whk4TmP80s70xYSAe1vj7bFJSxfGL7
 9ohT5y258TUGREPTrC9Cn5hs6YGDikQJPYbsGr+h7jHeHx9uvlRu00JHwEMx0kop7N3k
 nGBe+8XLWnBENDQmlBUCTi/XcuGTYoRwmvaXWivbfbEatValnNmKYYKFmYxbm0HGoAVc
 /urLGZo8X1Jjzt4nZm7ejOSOv6DFipjNLqptppfOIW72PBLVtii14ueVak1VfF+6twzR
 mUPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtQaYIY8ERYbjlDi8GkdA2mP/ecOsjfvmdTUCFP1eEmWc9jgHE5tfL91grHOAjKdaoicOkVICq9us1FiEkWBhi@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzhnhtc29fCU4f0Hy7aVc4pvijXfE5LMdeNuX6RCNHeyZyuVhLN
 g0A/60+qN97TOc0jbAIlBiKqh82HfGi3HTLH35wa6vO7iM0+JMhYKw476NpDko6+ntKImISC/er
 +P7iZJ0VcQgDVlH9XjGuoFk6ZlQ==
X-Google-Smtp-Source: AGHT+IFa1/z3OmNWJRFn7pOmrLwDKdq+UncKUvLXHcY+9584LDffNgyGIdkpaXYCSTZqvtr6F2u6H1JyPVJ9JsxmCw==
X-Received: from plxe3.prod.google.com ([2002:a17:902:ef43:b0:298:33c9:abd5])
 (user=joannechien job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:38cd:b0:295:fac:7b72 with SMTP id
 d9443c01a7336-2984ede39d5mr36881895ad.52.1762955550222; 
 Wed, 12 Nov 2025 05:52:30 -0800 (PST)
Date: Wed, 12 Nov 2025 13:52:21 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112135223.3467852-1-joannechien@google.com>
To: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently, residual options can interfere with checking the
 mount behavior of the listed MKFS_OPTIONS and MOUNT_OPTIONS. For example,
 "Option#120: test_dummy_encryption" should fail with the listed op [...] 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.222.202 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.202 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1vJBig-0001Y7-L3
Subject: [f2fs-dev] [PATCH v1 1/3] f2fs/015: clear MKFS_OPTIONS and
 MOUNT_OPTIONS
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
From: Joanne Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Joanne Chang <joannechien@google.com>
Cc: Joanne Chang <joannechien@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q3VycmVudGx5LCByZXNpZHVhbCBvcHRpb25zIGNhbiBpbnRlcmZlcmUgd2l0aCBjaGVja2luZyB0
aGUgbW91bnQKYmVoYXZpb3Igb2YgdGhlIGxpc3RlZCBNS0ZTX09QVElPTlMgYW5kIE1PVU5UX09Q
VElPTlMuIEZvciBleGFtcGxlLAoiT3B0aW9uIzEyMDogdGVzdF9kdW1teV9lbmNyeXB0aW9uIiBz
aG91bGQgZmFpbCB3aXRoIHRoZSBsaXN0ZWQKb3B0aW9ucyBidXQgc3VjY2VlZHMgaWYg4oCcTUtG
U19PUFRJT05TPWVuY3J5cHTigJ0gaXMgcHJlc2V0LiBCeQpleHBsaWNpdGx5IGNsZWFyaW5nIE1L
RlNfT1BUSU9OUyBhbmQgTU9VTlRfT1BUSU9OUywgdGhlIHRlc3TigJlzCnJlbGlhYmlsaXR5IGNh
biBiZSBpbXByb3ZlZC4KCmYyZnMvMDE1Lm91dCBpcyBhbHNvIHVwZGF0ZWQgdG8gZXhwZWN0IGZh
aWx1cmUgZm9yIGNhc2VzIHRoYXQgcmVxdWlyZQphZGRpdGlvbmFsIG1rZnMgYXR0cmlidXRlcyB0
byBtb3VudC4KClNpZ25lZC1vZmYtYnk6IEpvYW5uZSBDaGFuZyA8am9hbm5lY2hpZW5AZ29vZ2xl
LmNvbT4KLS0tCiB0ZXN0cy9mMmZzLzAxNSAgICAgfCAzICsrKwogdGVzdHMvZjJmcy8wMTUub3V0
IHwgOCArKysrLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvZjJmcy8wMTUgYi90ZXN0cy9mMmZzLzAxNQppbmRl
eCA3M2FjM2Q4Mi4uNmE3YTU4MmMgMTAwNzU1Ci0tLSBhL3Rlc3RzL2YyZnMvMDE1CisrKyBiL3Rl
c3RzL2YyZnMvMDE1CkBAIC0xMDMsNiArMTAzLDkgQEAgb3B0aW9ucz0oCiAJIm5vcmVjb3Zlcnks
cm8iCQkJIiIJCQlcCiApCiAKKyMgcmVtb3ZlIGFsbCBta2ZzL21vdW50IG9wdGlvbnMgdG8gYXZv
aWQgYWZmZWN0aW5nIHJlc3VsdHMKK2V4cG9ydCBNS0ZTX09QVElPTlM9IiIKK2V4cG9ydCBNT1VO
VF9PUFRJT05TPSIiCiBmb3IgKChpPTA7aTwkeyNvcHRpb25zW0BdfTtpPWkrMikpCiBkbwogCWVj
aG8gIk9wdGlvbiMkaTogJHtvcHRpb25zWyRpXX0gOiAke29wdGlvbnNbJCgoaSsxKSldfSIKZGlm
ZiAtLWdpdCBhL3Rlc3RzL2YyZnMvMDE1Lm91dCBiL3Rlc3RzL2YyZnMvMDE1Lm91dAppbmRleCA4
ZDY3MTJmMC4uM2RmMjk0MzYgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2YyZnMvMDE1Lm91dAorKysgYi90
ZXN0cy9mMmZzLzAxNS5vdXQKQEAgLTM4LDcgKzM4LDcgQEAgT3B0aW9uIzM0OiBpbmxpbmVfeGF0
dHIgOgogT3B0aW9uIzM2OiBub2lubGluZV94YXR0ciA6IAogMAogT3B0aW9uIzM4OiBpbmxpbmVf
eGF0dHJfc2l6ZT00MDAgOiAKLTAKKzMyCiBPcHRpb24jNDA6IGlubGluZV9kYXRhIDogCiAwCiBP
cHRpb24jNDI6IG5vaW5saW5lX2RlbnRyeSA6IApAQCAtMTIwLDExICsxMjAsMTEgQEAgT3B0aW9u
IzExNjogZnN5bmNfbW9kZT1zdHJpY3QgOgogT3B0aW9uIzExODogZnN5bmNfbW9kZT1ub2JhcnJp
ZXIgOiAKIDAKIE9wdGlvbiMxMjA6IHRlc3RfZHVtbXlfZW5jcnlwdGlvbiA6IAotMAorMzIKIE9w
dGlvbiMxMjI6IHRlc3RfZHVtbXlfZW5jcnlwdGlvbj12MSA6IAotMAorMzIKIE9wdGlvbiMxMjQ6
IHRlc3RfZHVtbXlfZW5jcnlwdGlvbj12MiA6IAotMAorMzIKIE9wdGlvbiMxMjY6IGNoZWNrcG9p
bnQ9ZW5hYmxlIDogCiAwCiBPcHRpb24jMTI4OiBjaGVja3BvaW50PWRpc2FibGUgOiAKLS0gCjIu
NTEuMi4xMDQxLmdjMWFiNWI5MGNhLWdvb2cKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
