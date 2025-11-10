Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A845C455C6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Nov 2025 09:22:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKsMeg5FBe2OMGX62f+pSQlfBBzsdzg4o2azB/eC7e8=; b=VEAqwVrSXJ7f9YMkr/2/fdwajH
	mBjYZ/oVvFEiCPK/oPwY/QjKfxWMsnIJeyeYPCHWHS8C9S83dJQBuDe7a6RQ+qxJEVG+VK7itIfp8
	WLXIvdn/khDIzyixHYa4ELhON5q9w8DebUMkz49XI3mGLzas71i+biRZnmccer65qYwA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vINAo-0004n8-8m;
	Mon, 10 Nov 2025 08:22:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vINAm-0004n2-Sj
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 08:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0XbEWkc5wtJ3QQ5tF6Cw8NY65vI401l89Uj1Zvz0unc=; b=mhsaK/JJQcl+slAwm1jbP9QuyS
 QvsFXYnEbRtGSFHaEvJALMJUlKLBaFlW5+kXYZQDKj+P702HdnG+jiIZyE4STpeygfrkxDvxFKkcS
 lhr3Uq2Faserx5vZutiCnfR3ufprEJVmVrfI5l5kxBAzTGbwDPNQ7cRlr3CgX8qO2Hqg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0XbEWkc5wtJ3QQ5tF6Cw8NY65vI401l89Uj1Zvz0unc=; b=O7NJ50QSsEwHXY/P5JsN4Ci4LX
 /YCdcPUUvwfMov3fvuGpDvXJZItpBQtNpWxQuUqKLwWWxYgq0L/y4A4AJMaSYhN/NEJ/vZnuCaWIa
 fCPQ6lQbYMzztEDEi6SBNrCA9KdQw9iSZvq5Im5ua05W2r4rJhiQxOosEmPbzkRauXRE=;
Received: from mail-pg1-f173.google.com ([209.85.215.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vINAm-0007a1-8f for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 08:22:48 +0000
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b99dc8f439cso1141225a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Nov 2025 00:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762762962; x=1763367762; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0XbEWkc5wtJ3QQ5tF6Cw8NY65vI401l89Uj1Zvz0unc=;
 b=ZLuQEoynzmRatNOcRdbLmaOsxzIIauy2eBtY8lRgmFSMRgGvxE4Ui9EqeJmvp0EAEz
 CNmS+jiCV+6M/S/GY+4THqaqXCVtU59bMjkcYIFnLWU4TXV/lSbwrL7zTmqvJifGtFCb
 ULC6kJ1hT0HkHHzNbneTCWbHPrIePb/WmdvnD2SQxWCWDqFuOJ6KhICtfCqUoZu8/wt+
 6AsYMFUo/EKRz4/FMhkNn62sRWEXeQqpnj/08SSFN78q+5WkGzkqD3OZB20tlQs2qo59
 T8JGZbgMvPATkK4xbvSHhbKo+YhfvTbXCqP/mcaL9N2WZJRmqhGrrqMkk0tgkS+vpuih
 eoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762762962; x=1763367762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0XbEWkc5wtJ3QQ5tF6Cw8NY65vI401l89Uj1Zvz0unc=;
 b=TTcXvKNXnw3hTam67GVCU4GJqsubzAD40FTqDvJiNfEOoHJ5BxkNJiRSivlxXx7CHa
 ATCreNPfUw3ecvwLKdOPd78DGccvgiTunamgscU1t80V/IZmelEqwAWmnx/oNhpEumjz
 CChNU34rP0t0RKpaFfYLDV1ERNv727K3NMaCsXDfAvr53nbgsI0le2PpmiaN/E92iHXI
 /z/5cBfiFjeeVVbgdhXTQ0A9LfeMPtYd4bKJAc/JXeS4TzqAvdGoIvdEM2KuK/B12DNq
 KY3ThBKqaOUuPySngFyFJZFXE1lZ3G88JkK4o+GddkrYxsoL4luVKeYwOTX9sIL9vOG4
 ZjUQ==
X-Gm-Message-State: AOJu0YxEsmuPlAaHaCGDKPqLbRX5rTUCuxvyhEDM5dTJCkRywws5+pTQ
 fWdqxB8yQhPXCg9xoeyrizrBGy2SSpdTvSlhMAytt+gnX+3pvlcwjT7C
X-Gm-Gg: ASbGncs3ER+IC5G1992sLzS2Mi87I79O4FQrIq3P5NSqI9T83xz3PgPzYEtD6ZPwzt8
 cwHrJddahhXWRSwhhVcpAMpCwc1Lb4iMex8Dpw6TpNSW81Db8zAJgp6u/R/g2o1Bril+m2/dBTh
 EsTckWBSklNaANb3NORcyLpRc8Pu/HgBIxEyutDhwxVcYyOzmbczPtKNQhLg8f15I/oESIHr+bV
 PzyqXuVIB+Nj21kHvtsUOQLFcWVbPf5OTg9LIjodPYuQCCSUErQ6Ld4fiwnFJzaGjkJq/ZPye7W
 oqVCHUIzSmI4vdqriATzVR8LVDfxRRkb7TjUBW/Kan0g5Hv2LWr33mlGC4QNpbUGgGpTdUx7VDD
 Plm/XZIm/Q29s1/0yJEDqRb4ypjBdrDLee00iMvQuvOobvhh3hPgYkL4z4ewJHPSl8GNssoQbRK
 mKWdKC5qTpzi5j/0sEn2Edt8tak1gQwO6kHFol6Po8Bbo5pCAUA89N4lobJTwPeg==
X-Google-Smtp-Source: AGHT+IEiV6RZXN8nWlBKpTXL07suTsDMXT5tOy0Y9DLWpvMaE7rv5+tdEkAntHy5ld8e4oMD+B5H4g==
X-Received: by 2002:a17:90b:3512:b0:313:1c7b:fc62 with SMTP id
 98e67ed59e1d1-3436cb91aebmr9268692a91.22.1762762962412; 
 Mon, 10 Nov 2025 00:22:42 -0800 (PST)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ba8f0d16483sm11590059a12.0.2025.11.10.00.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 00:22:42 -0800 (PST)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon, 10 Nov 2025 16:22:23 +0800
Message-ID: <20251110082223.902207-3-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110082223.902207-1-yangyongpeng.storage@gmail.com>
References: <20251110082223.902207-1-yangyongpeng.storage@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Yongpeng Yang When emulating a ZNS SSD on qemu with
 zoned.max_open set to 0, the F2FS can still be mounted successfully. The sysfs
 entry shows sbi->max_open_zones as UINT_MAX. root@fedora-vm:~# cat
 /sys/block/nvme0n1/queue/zoned
 host-managed root@fedora-vm:~# cat /sys/block/nvme0n1/queue/max_open_zones
 0 root@fedora-vm:~# mkfs.f2fs -m -c /dev/nvme0n1 /dev/vda root@fedora-vm
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vINAm-0007a1-8f
Subject: [f2fs-dev] [PATCH v2 3/3] f2fs: fix handling of zoned block devices
 with max_open_zones == 0
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RnJvbTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+CgpXaGVuIGVtdWxh
dGluZyBhIFpOUyBTU0Qgb24gcWVtdSB3aXRoIHpvbmVkLm1heF9vcGVuIHNldCB0byAwLCB0aGUK
RjJGUyBjYW4gc3RpbGwgYmUgbW91bnRlZCBzdWNjZXNzZnVsbHkuIFRoZSBzeXNmcyBlbnRyeSBz
aG93cwpzYmktPm1heF9vcGVuX3pvbmVzIGFzIFVJTlRfTUFYLgoKcm9vdEBmZWRvcmEtdm06fiMg
Y2F0IC9zeXMvYmxvY2svbnZtZTBuMS9xdWV1ZS96b25lZApob3N0LW1hbmFnZWQKcm9vdEBmZWRv
cmEtdm06fiMgY2F0IC9zeXMvYmxvY2svbnZtZTBuMS9xdWV1ZS9tYXhfb3Blbl96b25lcwowCnJv
b3RAZmVkb3JhLXZtOn4jIG1rZnMuZjJmcyAtbSAtYyAvZGV2L252bWUwbjEgL2Rldi92ZGEKcm9v
dEBmZWRvcmEtdm06fiMgbW91bnQgL2Rldi92ZGEgL21udC9mMmZzLwpyb290QGZlZG9yYS12bTp+
IyBjYXQgL3N5cy9mcy9mMmZzL3ZkYS9tYXhfb3Blbl96b25lcwo0Mjk0OTY3Mjk1CgpUaGUgcm9v
dCBjYXVzZSBpcyB0aGF0IHNiaS0+bWF4X29wZW5fem9uZXMgaXMgaW5pdGlhbGl6ZWQgdG8gVUlO
VF9NQVgKYW5kIG9ubHkgdXBkYXRlZCB3aGVuIHRoZSBkZXZpY2XigJlzIG1heF9vcGVuX3pvbmVz
IGlzIGdyZWF0ZXIgdGhhbiAwLgpIb3dldmVyLCBib3RoIHRoZSBzY3NpIGRyaXZlciAoc2RfemJj
X3JlYWRfem9uZXMgbWF5IGFzc2lnbnMgMCB0bwpkZXZpY2UncyBtYXhfb3Blbl96b25lcykgYW5k
IHRoZSBudm1lIGRyaXZlciAobnZtZV9xdWVyeV96b25lX2luZm8gZG9uJ3QKY2hlY2sgbWF4X29w
ZW5fem9uZXMpIGFsbG93IG1heF9vcGVuX3pvbmVzIHRvIGJlIDAuCgpUaGlzIHBhdGNoIGZpeGVz
IHRoZSBpc3N1ZSBieSBwcmV2ZW50aW5nIG1vdW50aW5nIG9uIHpvbmVkIFNTRHMgd2hlbgptYXhf
b3Blbl96b25lcyBpcyAwLCB3aGlsZSBzdGlsbCBhbGxvd2luZyBTTVIgSEREcyB0byBiZSBtb3Vu
dGVkLgppbml0X2Jsa3pfaW5mbygpIGlzIG9ubHkgY2FsbGVkIGJ5IGYyZnNfc2Nhbl9kZXZpY2Vz
KCksIGFuZCB0aGUKYmxrem9uZWQgZmVhdHVyZSBoYXMgYWxyZWFkeSBiZWVuIGNoZWNrZWQgdGhl
cmUuIFNvLCB0aGlzIHBhdGNoIGFsc28KcmVtb3ZlIHJlZHVuZGFudCB6b25lZCBkZXZpY2UgY2hl
Y2tzLgoKU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5j
b20+Ci0tLQogZnMvZjJmcy9zdXBlci5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCmluZGV4
IGRiN2FmYjgwNjQxMS4uNmRjODk0NWUyNGFmIDEwMDY0NAotLS0gYS9mcy9mMmZzL3N1cGVyLmMK
KysrIGIvZnMvZjJmcy9zdXBlci5jCkBAIC00MzUzLDIxICs0MzUzLDYgQEAgc3RhdGljIGludCBp
bml0X2Jsa3pfaW5mbyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCBkZXZpKQogCXVuc2ln
bmVkIGludCBtYXhfb3Blbl96b25lczsKIAlpbnQgcmV0OwogCi0JaWYgKCFmMmZzX3NiX2hhc19i
bGt6b25lZChzYmkpKQotCQlyZXR1cm4gMDsKLQotCWlmIChiZGV2X2lzX3pvbmVkKEZERVYoZGV2
aSkuYmRldikpIHsKLQkJbWF4X29wZW5fem9uZXMgPSBiZGV2X21heF9vcGVuX3pvbmVzKGJkZXYp
OwotCQlpZiAobWF4X29wZW5fem9uZXMgJiYgKG1heF9vcGVuX3pvbmVzIDwgc2JpLT5tYXhfb3Bl
bl96b25lcykpCi0JCQlzYmktPm1heF9vcGVuX3pvbmVzID0gbWF4X29wZW5fem9uZXM7Ci0JCWlm
IChzYmktPm1heF9vcGVuX3pvbmVzIDwgRjJGU19PUFRJT04oc2JpKS5hY3RpdmVfbG9ncykgewot
CQkJZjJmc19lcnIoc2JpLAotCQkJCSJ6b25lZDogbWF4IG9wZW4gem9uZXMgJXUgaXMgdG9vIHNt
YWxsLCBuZWVkIGF0IGxlYXN0ICV1IG9wZW4gem9uZXMiLAotCQkJCXNiaS0+bWF4X29wZW5fem9u
ZXMsIEYyRlNfT1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3MpOwotCQkJcmV0dXJuIC1FSU5WQUw7Ci0J
CX0KLQl9Ci0KIAl6b25lX3NlY3RvcnMgPSBiZGV2X3pvbmVfc2VjdG9ycyhiZGV2KTsKIAlpZiAo
c2JpLT5ibG9ja3NfcGVyX2Jsa3ogJiYgc2JpLT5ibG9ja3NfcGVyX2Jsa3ogIT0KIAkJCQlTRUNU
T1JfVE9fQkxPQ0soem9uZV9zZWN0b3JzKSkKQEAgLTQzNzgsNiArNDM2MywyNyBAQCBzdGF0aWMg
aW50IGluaXRfYmxrel9pbmZvKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IGRldmkpCiAJ
aWYgKG5yX3NlY3RvcnMgJiAoem9uZV9zZWN0b3JzIC0gMSkpCiAJCUZERVYoZGV2aSkubnJfYmxr
eisrOwogCisJbWF4X29wZW5fem9uZXMgPSBiZGV2X21heF9vcGVuX3pvbmVzKGJkZXYpOworCWlm
ICghbWF4X29wZW5fem9uZXMpIHsKKwkJLyoKKwkJICogU1NEcyByZXF1aXJlIG1heF9vcGVuX3pv
bmVzID4gMCB0byBiZSBtb3VudGFibGUuCisJCSAqIEZvciBIRERzLCBpZiBtYXhfb3Blbl96b25l
cyBpcyByZXBvcnRlZCBhcyAwLCBpdCBkb2Vzbid0IG1hdHRlciwKKwkJICogc2V0IGl0IHRvIEZE
RVYoZGV2aSkubnJfYmxrei4KKwkJICovCisJCWlmIChiZGV2X25vbnJvdChiZGV2KSkgeworCQkJ
ZjJmc19lcnIoc2JpLCAiem9uZWQ6IFNTRCBkZXZpY2UgJXMgd2l0aG91dCBvcGVuIHpvbmVzIiwg
RkRFVihkZXZpKS5wYXRoKTsKKwkJCXJldHVybiAtRUlOVkFMOworCQl9CisJCW1heF9vcGVuX3pv
bmVzID0gRkRFVihkZXZpKS5ucl9ibGt6OworCX0KKwlzYmktPm1heF9vcGVuX3pvbmVzID0gbWlu
X3QodW5zaWduZWQgaW50LCBtYXhfb3Blbl96b25lcywgc2JpLT5tYXhfb3Blbl96b25lcyk7CisJ
aWYgKHNiaS0+bWF4X29wZW5fem9uZXMgPCBGMkZTX09QVElPTihzYmkpLmFjdGl2ZV9sb2dzKSB7
CisJCWYyZnNfZXJyKHNiaSwKKwkJCSJ6b25lZDogbWF4IG9wZW4gem9uZXMgJXUgaXMgdG9vIHNt
YWxsLCBuZWVkIGF0IGxlYXN0ICV1IG9wZW4gem9uZXMiLAorCQkJc2JpLT5tYXhfb3Blbl96b25l
cywgRjJGU19PUFRJT04oc2JpKS5hY3RpdmVfbG9ncyk7CisJCXJldHVybiAtRUlOVkFMOworCX0K
KwogCUZERVYoZGV2aSkuYmxrel9zZXEgPSBmMmZzX2t2emFsbG9jKHNiaSwKIAkJCQkJQklUU19U
T19MT05HUyhGREVWKGRldmkpLm5yX2Jsa3opCiAJCQkJCSogc2l6ZW9mKHVuc2lnbmVkIGxvbmcp
LAotLSAKMi40My4wCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
