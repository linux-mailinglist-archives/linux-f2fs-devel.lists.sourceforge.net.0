Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FD357716D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 Jul 2022 22:44:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oCoe4-00073X-Vq; Sat, 16 Jul 2022 20:44:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <fmdefrancesco@gmail.com>) id 1oCoe2-00073R-G6
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 16 Jul 2022 20:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yK1G4X/A5odloNuiZOHLngDtJZQ5c2A6ZaYNU/C2hR0=; b=crbRZOgNRtWP/baoyJ1gRbXkjU
 a8clOTC+jZr3CvsHlxjShW+NEuIxm5LtvPCJPkBm+3xsnDQVGNCpf23gu5uyU7Y/wUkzgEXT4zHHx
 zQIp25Zr+cU3RvuC+YkFNWApYlkMPQEFIJDNfPzNSrJh7N0zfEQVu7hFeG+bWH7BVCNw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yK1G4X/A5odloNuiZOHLngDtJZQ5c2A6ZaYNU/C2hR0=; b=V
 9KDyskE7ojzi5Z4/QbMtbXN6jSI2UIvNqK5vm8YzchUsbJh83OWkgugq22Lrg9z1+SZ/SRAAbqSoZ
 ibNe0/SeZ7bIe+8cwFS35t6drUy24R9nA8jo6H152Ig9S7JdGQy/lCo9rqApU/30cmwwpaMqHVLq5
 YWEAD9vo7sJrjgwI=;
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oCody-001M0Q-3q
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 16 Jul 2022 20:44:10 +0000
Received: by mail-wr1-f42.google.com with SMTP id v16so11514387wrd.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 16 Jul 2022 13:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yK1G4X/A5odloNuiZOHLngDtJZQ5c2A6ZaYNU/C2hR0=;
 b=V0JT/eaxewbfHHLgVRnRvqjHG/0Jhd9UK23+WyY55aNpmpkRomZzigCB2jW9Y5pPm0
 NSHiLVaqlcl3apPuWJz8Sxsza0g2BvPbqSqfEocQBglOIw5hdZl3ZysfsWyNxxFY+fL/
 rrCuy8YzdrxPynCf1ZiYm/GQiGPQuGS6B4S0KAKLsm0Na25Tr5timfI9h/aNYKzNWDc7
 ERSFvOjcLM3hNoijcCdeksTzLGrTLDmpwzob54dxVQiK29FKJGAlSRmtRb76vXcgXwmM
 qOoDOrNJIOU+Sh+eoXBhilo9bXZbfBRt3WnVlQsOASAt4TeFmcvas/VCnG6xR+JGQBYA
 7d3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yK1G4X/A5odloNuiZOHLngDtJZQ5c2A6ZaYNU/C2hR0=;
 b=7xEmXn/J/s6bcVvCKkgbKzqgQZx3MOKkLApMYNI2dFIN6rjIQ42vmwQ4T4gUAP2W1M
 8iZjkdXfoOtieQU34OIv3xkNQffdqr/pq7JtgMT+e3HpdTWby+ObJa6hMKK85e4irNd5
 dsQ2LTZaBzLWgvFY9dz0HNY4tL9/cm3XvUMphmZExOMo8F5dCtkGIgHo6aV148fMyrsu
 Xnt2j6C0H1QhAjjvCcAIAsioK/kwfmNdYWNsluINnTv62UrlWJkn4mzMyoT3vlwVUczO
 uFCd8jkhKUAlzghH59SJNFk2eZIVxVJvdcZQsjTY+jN65cTRgSSYLLDLRrAYOyLIKcbU
 Ns+A==
X-Gm-Message-State: AJIora/0qsj3EzVKp2d9xLhobrp3C8Sjsuf++MtG+ZoxMjfUi67TdUZ7
 xzrkHJsZoUo/HAGpKNo1gjHvxirUMwQ=
X-Google-Smtp-Source: AGRyM1tNvpDcRGh2ootpNNaGLi3aUImui+nJAiMJmpLILuIpDzQxpHGYbeNPZAxmj18z1Jgm0HMO5w==
X-Received: by 2002:a5d:6d09:0:b0:21d:9846:259c with SMTP id
 e9-20020a5d6d09000000b0021d9846259cmr17776250wrq.212.1658004239648; 
 Sat, 16 Jul 2022 13:43:59 -0700 (PDT)
Received: from localhost.localdomain
 (host-95-235-102-55.retail.telecomitalia.it. [95.235.102.55])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a05600c150400b003a03185231bsm9238252wmg.31.2022.07.16.13.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 13:43:58 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Nick Terrell <terrelln@fb.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Date: Sat, 16 Jul 2022 22:43:53 +0200
Message-Id: <20220716204353.22049-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The use of kmap() is being deprecated in favor of
 kmap_local_page().
 Two main problems with kmap(): (1) It comes with an overhead as mapping space
 is restricted and protected by a global lock for synchronization and (2)
 it also requires global TLB invalidation when the [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [fmdefrancesco[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.42 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.42 listed in list.dnswl.org]
X-Headers-End: 1oCody-001M0Q-3q
Subject: [f2fs-dev] [PATCH] f2fs: Use memcpy_page() in f2fs_copy_page()
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
Cc: Ira Weiny <ira.weiny@intel.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VGhlIHVzZSBvZiBrbWFwKCkgaXMgYmVpbmcgZGVwcmVjYXRlZCBpbiBmYXZvciBvZiBrbWFwX2xv
Y2FsX3BhZ2UoKS4KClR3byBtYWluIHByb2JsZW1zIHdpdGgga21hcCgpOiAoMSkgSXQgY29tZXMg
d2l0aCBhbiBvdmVyaGVhZCBhcyBtYXBwaW5nCnNwYWNlIGlzIHJlc3RyaWN0ZWQgYW5kIHByb3Rl
Y3RlZCBieSBhIGdsb2JhbCBsb2NrIGZvciBzeW5jaHJvbml6YXRpb24gYW5kCigyKSBpdCBhbHNv
IHJlcXVpcmVzIGdsb2JhbCBUTEIgaW52YWxpZGF0aW9uIHdoZW4gdGhlIGttYXDigJlzIHBvb2wg
d3JhcHMKYW5kIGl0IG1pZ2h0IGJsb2NrIHdoZW4gdGhlIG1hcHBpbmcgc3BhY2UgaXMgZnVsbHkg
dXRpbGl6ZWQgdW50aWwgYSBzbG90CmJlY29tZXMgYXZhaWxhYmxlLgoKVGhlcmVmb3JlLCByZXBs
YWNlIGttYXAoKSB3aXRoIGttYXBfbG9jYWxfcGFnZSgpIGluIGYyZnNfY29weV9wYWdlKCkgYW5k
CnVzZSBtZW1jcHlfcGFnZSgpIGluc3RlYWQgb2Ygb3BlbiBjb2Rpbmcga21hcF9sb2NhbF9wYWdl
KCkgKyBtZW1jcHkoKS4KClN1Z2dlc3RlZC1ieTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBGYWJpbyBNLiBEZSBGcmFuY2VzY28gPGZtZGVmcmFuY2VzY29A
Z21haWwuY29tPgotLS0KIGZzL2YyZnMvZjJmcy5oIHwgNiArLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9mMmZzL2Yy
ZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCmluZGV4IGQ5YmJlY2QwMDhkMi4uZjA0ZTc2MGJiMWMxIDEw
MDY0NAotLS0gYS9mcy9mMmZzL2YyZnMuaAorKysgYi9mcy9mMmZzL2YyZnMuaApAQCAtMjY5OCwx
MiArMjY5OCw4IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IHBhZ2UgKmYyZnNfcGFnZWNhY2hlX2dl
dF9wYWdlKAogCiBzdGF0aWMgaW5saW5lIHZvaWQgZjJmc19jb3B5X3BhZ2Uoc3RydWN0IHBhZ2Ug
KnNyYywgc3RydWN0IHBhZ2UgKmRzdCkKIHsKLQljaGFyICpzcmNfa2FkZHIgPSBrbWFwKHNyYyk7
Ci0JY2hhciAqZHN0X2thZGRyID0ga21hcChkc3QpOwogCi0JbWVtY3B5KGRzdF9rYWRkciwgc3Jj
X2thZGRyLCBQQUdFX1NJWkUpOwotCWt1bm1hcChkc3QpOwotCWt1bm1hcChzcmMpOworCW1lbWNw
eV9wYWdlKGRzdCwgMCwgc3JjLCAwLCBQQUdFX1NJWkUpOwogfQogCiBzdGF0aWMgaW5saW5lIHZv
aWQgZjJmc19wdXRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSwgaW50IHVubG9jaykKLS0gCjIuMzcu
MQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
