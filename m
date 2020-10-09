Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9FB28946F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Oct 2020 21:54:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQySv-0006ko-V3; Fri, 09 Oct 2020 19:54:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>)
 id 1kQySu-0006im-Jo; Fri, 09 Oct 2020 19:54:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LxIUVirtIf7GFgRi4xb32We3PfTkH+1lTeZm8mNK484=; b=S8JMCKGKs+eirXm9vdqypou4xw
 jMniuTiuAvf/gsg4JX8omy8LTVZHYSrVQI1p4cAr6uwe2EA59K1K2lI8kWrNummqflCSZVeto0QAQ
 7G2XGjrSajgCtME5dCAPBblFhAgcqC8pQrnVz5pKQCv6hf+GZ2vLeZZdm7egDmaXkFqE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LxIUVirtIf7GFgRi4xb32We3PfTkH+1lTeZm8mNK484=; b=UELwsMA+PXcCfRkRXptmSrHBvh
 NYG5LNNdm8sfPaWfM9BN6I3hM53XWRjqEg+0GHiTQM0UhC1DDPVAJ6AQcnemAY8SwYRK5OT7yCH7X
 snEav1h7OljBPRBli96FOC/FYt4M811uGvsvywC5CXcEpX5f280ovJKXMkvM1qOwJ1hQ=;
Received: from mga09.intel.com ([134.134.136.24])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQySm-008s6y-9Q; Fri, 09 Oct 2020 19:54:08 +0000
IronPort-SDR: Mjtu/L0yiNTnM4zIEMQpoNL/sXWA84jQW+cuZL+QQuH8LbCCE7/4SGH1qNjenG2UWFqitMbzDy
 94zLC2wsLP8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="165643370"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="165643370"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:54 -0700
IronPort-SDR: bZn0Zma13YkX7FJFkNsCYMjMNff2FSiB/MgoUwYT50qMOfu0yRYfZtOtUYx1uwuwPtN+tdFX+r
 hwly4wq6Ikyg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="519847271"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:53 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:50:28 -0700
Message-Id: <20201009195033.3208459-54-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.org.uk]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [134.134.136.24 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kQySm-008s6y-9Q
Subject: [f2fs-dev] [PATCH RFC PKS/PMEM 53/58] lib: Utilize new kmap_thread()
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
Cc: linux-aio@kvack.org, Song Liu <songliubraving@fb.com>,
 linux-efi@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-rdma@vger.kernel.org, x86@kernel.org,
 John Fastabend <john.fastabend@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-afs@lists.infradead.org, cluster-devel@redhat.com,
 linux-cachefs@redhat.com, intel-wired-lan@lists.osuosl.org,
 Yonghong Song <yhs@fb.com>, linux-ext4@vger.kernel.org,
 Andrii Nakryiko <andriin@fb.com>, Fenghua Yu <fenghua.yu@intel.com>,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, xen-devel@lists.xenproject.org,
 KP Singh <kpsingh@chromium.org>, Dan Williams <dan.j.williams@intel.com>,
 io-uring@vger.kernel.org, linux-bcache@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Martin KaFai Lau <kafai@fb.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RnJvbTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgoKVGhlc2Uga21hcCgpIGNhbGxz
IGFyZSBsb2NhbGl6ZWQgdG8gYSBzaW5nbGUgdGhyZWFkLiAgVG8gYXZvaWQgdGhlIG92ZXIKaGVh
ZCBvZiBnbG9iYWwgUEtSUyB1cGRhdGVzIHVzZSB0aGUgbmV3IGttYXBfdGhyZWFkKCkgY2FsbC4K
CkNjOiBBbGV4YW5kZXIgVmlybyA8dmlyb0B6ZW5pdi5saW51eC5vcmcudWs+CkNjOiAiSsOpcsO0
bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogTWFydGluIEthRmFpIExhdSA8a2Fm
YWlAZmIuY29tPgpDYzogU29uZyBMaXUgPHNvbmdsaXVicmF2aW5nQGZiLmNvbT4KQ2M6IFlvbmdo
b25nIFNvbmcgPHloc0BmYi5jb20+CkNjOiBBbmRyaWkgTmFrcnlpa28gPGFuZHJpaW5AZmIuY29t
PgpDYzogSm9obiBGYXN0YWJlbmQgPGpvaG4uZmFzdGFiZW5kQGdtYWlsLmNvbT4KQ2M6IEtQIFNp
bmdoIDxrcHNpbmdoQGNocm9taXVtLm9yZz4KU2lnbmVkLW9mZi1ieTogSXJhIFdlaW55IDxpcmEu
d2VpbnlAaW50ZWwuY29tPgotLS0KIGxpYi9pb3ZfaXRlci5jIHwgMTIgKysrKysrLS0tLS0tCiBs
aWIvdGVzdF9icGYuYyB8ICA0ICsrLS0KIGxpYi90ZXN0X2htbS5jIHwgIDggKysrKy0tLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvbGliL2lvdl9pdGVyLmMgYi9saWIvaW92X2l0ZXIuYwppbmRleCA1ZTQwNzg2YzhmMTIu
LjFkNDdmOTU3Y2Y5NSAxMDA2NDQKLS0tIGEvbGliL2lvdl9pdGVyLmMKKysrIGIvbGliL2lvdl9p
dGVyLmMKQEAgLTIwOCw3ICsyMDgsNyBAQCBzdGF0aWMgc2l6ZV90IGNvcHlfcGFnZV90b19pdGVy
X2lvdmVjKHN0cnVjdCBwYWdlICpwYWdlLCBzaXplX3Qgb2Zmc2V0LCBzaXplX3QgYgogCX0KIAkv
KiBUb28gYmFkIC0gcmV2ZXJ0IHRvIG5vbi1hdG9taWMga21hcCAqLwogCi0Ja2FkZHIgPSBrbWFw
KHBhZ2UpOworCWthZGRyID0ga21hcF90aHJlYWQocGFnZSk7CiAJZnJvbSA9IGthZGRyICsgb2Zm
c2V0OwogCWxlZnQgPSBjb3B5b3V0KGJ1ZiwgZnJvbSwgY29weSk7CiAJY29weSAtPSBsZWZ0OwpA
QCAtMjI1LDcgKzIyNSw3IEBAIHN0YXRpYyBzaXplX3QgY29weV9wYWdlX3RvX2l0ZXJfaW92ZWMo
c3RydWN0IHBhZ2UgKnBhZ2UsIHNpemVfdCBvZmZzZXQsIHNpemVfdCBiCiAJCWZyb20gKz0gY29w
eTsKIAkJYnl0ZXMgLT0gY29weTsKIAl9Ci0Ja3VubWFwKHBhZ2UpOworCWt1bm1hcF90aHJlYWQo
cGFnZSk7CiAKIGRvbmU6CiAJaWYgKHNraXAgPT0gaW92LT5pb3ZfbGVuKSB7CkBAIC0yOTIsNyAr
MjkyLDcgQEAgc3RhdGljIHNpemVfdCBjb3B5X3BhZ2VfZnJvbV9pdGVyX2lvdmVjKHN0cnVjdCBw
YWdlICpwYWdlLCBzaXplX3Qgb2Zmc2V0LCBzaXplX3QKIAl9CiAJLyogVG9vIGJhZCAtIHJldmVy
dCB0byBub24tYXRvbWljIGttYXAgKi8KIAotCWthZGRyID0ga21hcChwYWdlKTsKKwlrYWRkciA9
IGttYXBfdGhyZWFkKHBhZ2UpOwogCXRvID0ga2FkZHIgKyBvZmZzZXQ7CiAJbGVmdCA9IGNvcHlp
bih0bywgYnVmLCBjb3B5KTsKIAljb3B5IC09IGxlZnQ7CkBAIC0zMDksNyArMzA5LDcgQEAgc3Rh
dGljIHNpemVfdCBjb3B5X3BhZ2VfZnJvbV9pdGVyX2lvdmVjKHN0cnVjdCBwYWdlICpwYWdlLCBz
aXplX3Qgb2Zmc2V0LCBzaXplX3QKIAkJdG8gKz0gY29weTsKIAkJYnl0ZXMgLT0gY29weTsKIAl9
Ci0Ja3VubWFwKHBhZ2UpOworCWt1bm1hcF90aHJlYWQocGFnZSk7CiAKIGRvbmU6CiAJaWYgKHNr
aXAgPT0gaW92LT5pb3ZfbGVuKSB7CkBAIC0xNzQyLDEwICsxNzQyLDEwIEBAIGludCBpb3ZfaXRl
cl9mb3JfZWFjaF9yYW5nZShzdHJ1Y3QgaW92X2l0ZXIgKmksIHNpemVfdCBieXRlcywKIAkJcmV0
dXJuIDA7CiAKIAlpdGVyYXRlX2FsbF9raW5kcyhpLCBieXRlcywgdiwgLUVJTlZBTCwgKHsKLQkJ
dy5pb3ZfYmFzZSA9IGttYXAodi5idl9wYWdlKSArIHYuYnZfb2Zmc2V0OworCQl3Lmlvdl9iYXNl
ID0ga21hcF90aHJlYWQodi5idl9wYWdlKSArIHYuYnZfb2Zmc2V0OwogCQl3Lmlvdl9sZW4gPSB2
LmJ2X2xlbjsKIAkJZXJyID0gZigmdywgY29udGV4dCk7Ci0JCWt1bm1hcCh2LmJ2X3BhZ2UpOwor
CQlrdW5tYXBfdGhyZWFkKHYuYnZfcGFnZSk7CiAJCWVycjt9KSwgKHsKIAkJdyA9IHY7CiAJCWVy
ciA9IGYoJncsIGNvbnRleHQpO30pCmRpZmYgLS1naXQgYS9saWIvdGVzdF9icGYuYyBiL2xpYi90
ZXN0X2JwZi5jCmluZGV4IGNhN2Q2MzViY2NkOS4uNDQxZjgyMmY1NmJhIDEwMDY0NAotLS0gYS9s
aWIvdGVzdF9icGYuYworKysgYi9saWIvdGVzdF9icGYuYwpAQCAtNjUwNiwxMSArNjUwNiwxMSBA
QCBzdGF0aWMgdm9pZCAqZ2VuZXJhdGVfdGVzdF9kYXRhKHN0cnVjdCBicGZfdGVzdCAqdGVzdCwg
aW50IHN1YikKIAkJaWYgKCFwYWdlKQogCQkJZ290byBlcnJfa2ZyZWVfc2tiOwogCi0JCXB0ciA9
IGttYXAocGFnZSk7CisJCXB0ciA9IGttYXBfdGhyZWFkKHBhZ2UpOwogCQlpZiAoIXB0cikKIAkJ
CWdvdG8gZXJyX2ZyZWVfcGFnZTsKIAkJbWVtY3B5KHB0ciwgdGVzdC0+ZnJhZ19kYXRhLCBNQVhf
REFUQSk7Ci0JCWt1bm1hcChwYWdlKTsKKwkJa3VubWFwX3RocmVhZChwYWdlKTsKIAkJc2tiX2Fk
ZF9yeF9mcmFnKHNrYiwgMCwgcGFnZSwgMCwgTUFYX0RBVEEsIE1BWF9EQVRBKTsKIAl9CiAKZGlm
ZiAtLWdpdCBhL2xpYi90ZXN0X2htbS5jIGIvbGliL3Rlc3RfaG1tLmMKaW5kZXggZTdkYzNkZTM1
NWI3Li5lNDBkMjZmOTdmNDUgMTAwNjQ0Ci0tLSBhL2xpYi90ZXN0X2htbS5jCisrKyBiL2xpYi90
ZXN0X2htbS5jCkBAIC0zMjksOSArMzI5LDkgQEAgc3RhdGljIGludCBkbWlycm9yX2RvX3JlYWQo
c3RydWN0IGRtaXJyb3IgKmRtaXJyb3IsIHVuc2lnbmVkIGxvbmcgc3RhcnQsCiAJCWlmICghcGFn
ZSkKIAkJCXJldHVybiAtRU5PRU5UOwogCi0JCXRtcCA9IGttYXAocGFnZSk7CisJCXRtcCA9IGtt
YXBfdGhyZWFkKHBhZ2UpOwogCQltZW1jcHkocHRyLCB0bXAsIFBBR0VfU0laRSk7Ci0JCWt1bm1h
cChwYWdlKTsKKwkJa3VubWFwX3RocmVhZChwYWdlKTsKIAogCQlwdHIgKz0gUEFHRV9TSVpFOwog
CQlib3VuY2UtPmNwYWdlcysrOwpAQCAtMzk4LDkgKzM5OCw5IEBAIHN0YXRpYyBpbnQgZG1pcnJv
cl9kb193cml0ZShzdHJ1Y3QgZG1pcnJvciAqZG1pcnJvciwgdW5zaWduZWQgbG9uZyBzdGFydCwK
IAkJaWYgKCFwYWdlIHx8IHhhX3BvaW50ZXJfdGFnKGVudHJ5KSAhPSBEUFRfWEFfVEFHX1dSSVRF
KQogCQkJcmV0dXJuIC1FTk9FTlQ7CiAKLQkJdG1wID0ga21hcChwYWdlKTsKKwkJdG1wID0ga21h
cF90aHJlYWQocGFnZSk7CiAJCW1lbWNweSh0bXAsIHB0ciwgUEFHRV9TSVpFKTsKLQkJa3VubWFw
KHBhZ2UpOworCQlrdW5tYXBfdGhyZWFkKHBhZ2UpOwogCiAJCXB0ciArPSBQQUdFX1NJWkU7CiAJ
CWJvdW5jZS0+Y3BhZ2VzKys7Ci0tIAoyLjI4LjAucmMwLjEyLmdiNmE2NThiZDAwYzkKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
