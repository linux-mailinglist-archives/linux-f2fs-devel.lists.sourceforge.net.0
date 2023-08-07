Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F105772819
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 16:45:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qT1U1-0006lQ-2o;
	Mon, 07 Aug 2023 14:45:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joel@joelfernandes.org>) id 1qT1Ty-0006lI-TX
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 14:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=miXhKIkPE3lmozcU/B+jO2gbohIQfxtvXQrL6JQrLaA=; b=Iycu9pKdIfVDVFpK5StIwvZAwu
 CoGctg0KGxB2XR0kdD5Q7kWrxAr2xu/zKk/F0X1CA8lT9GqS4/XdQhVDAoM5FoAFXBE92FWVhARhy
 YoQ/x7TjdOzWgJ/4vWRLTnAdz7WURtjbiIPKjyyPX5RL5Bg80dWJqGhX54w64HfutF2c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=miXhKIkPE3lmozcU/B+jO2gbohIQfxtvXQrL6JQrLaA=; b=aN1T2b4uLzl9FBPr8UamcTmv3N
 zNRZo56AYcdYseXSP8dpjaJwtqFpA2bXwVIuvYceMWbSAseOZXrLnsw3P3KXdAvA3Xe/DZ4tfXhIT
 OYNaQGohZeCLrJl0R/bv9BhFA/GToprIWR4LzFHRungXEZLAW/4PN5wnBfljDawuHJbY=;
Received: from mail-ed1-f50.google.com ([209.85.208.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qT1Tr-00009r-3H for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 14:45:11 +0000
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-523225dd110so4117451a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Aug 2023 07:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google; t=1691419504; x=1692024304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=miXhKIkPE3lmozcU/B+jO2gbohIQfxtvXQrL6JQrLaA=;
 b=SLzIxoarlILKP4x2zirKuJ5XU3oJqLByfILYkYgKlrXYu1iYuMsEpTSJuFo1zkd5SR
 7lVLb0oj928zNkfcvqsKswnSfHryIXfBXiwQqfteuaN1m1ejXsJSwNhUK9kYRMmjqkfR
 MeSnyU7vnE4IOmeefbaYeMQ7mSBbqR4D19to8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691419504; x=1692024304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=miXhKIkPE3lmozcU/B+jO2gbohIQfxtvXQrL6JQrLaA=;
 b=FSiSAikeVbofkQECmjgTpT3meoTKeifvmDvIpEFDOUd6l8Mrrt7ncl53ZRSvSK/his
 QMtrBIhQRDDMHVvl2obmRC+5iB5eoUBPqSAQ39e766zn5Zkzkb3UD7j+STvl5cOlFwt9
 o+jeX4ZU+8W7RomSaqfcmu4npyzL4bp9QLlm2wx6kSNrTmHnQLgbsToCJfc0h14a2uWc
 LCEE3Ly/sIXJpCvm24O/YtqXNaLPcaUA23+w/3Pzv827oRklz2c9xkBFOUo7xzsh1Stq
 MBhSfsEk21Dc/GkyWSYM3ASL3WAwrRoZNn/5UkzOdVc7NenAn08UKFt2NTrYFt6qhHzW
 R+WQ==
X-Gm-Message-State: AOJu0Yz3vdAb90atAStj7g3ONAQpoYb8itICUXEdwrwKK1E1wqJyN1wP
 oinlsuDQMUfn8qi4hwpTvZl/vfpCn6j28ykO1xOf/KClzIZQCnyO
X-Google-Smtp-Source: AGHT+IEUzxQ8uhfef4Gwj5w4R2S1a/fG2YmFdaAnrERcAODuTjnUg5MW8ffcyCI3WwFTK01hsv/WyE2OTkrmMwFZBOU=
X-Received: by 2002:a2e:9254:0:b0:2b6:dfef:d526 with SMTP id
 v20-20020a2e9254000000b002b6dfefd526mr6547671ljg.11.1691417693488; Mon, 07
 Aug 2023 07:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-20-zhengqi.arch@bytedance.com>
In-Reply-To: <20230807110936.21819-20-zhengqi.arch@bytedance.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Mon, 7 Aug 2023 10:14:48 -0400
Message-ID: <CAEXW_YQHGBE2kKupLf12BGOEU5GnQsBUtVQcyMnzxUZ4y48QFA@mail.gmail.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Aug 7, 2023 at 7:17 AM Qi Zheng <zhengqi.arch@bytedance.com>
    wrote: > > Use new APIs to dynamically allocate the rcu-kfree shrinker. >
    > Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com> 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.50 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.50 listed in wl.mailspike.net]
X-Headers-End: 1qT1Tr-00009r-3H
Subject: Re: [f2fs-dev] [PATCH v4 19/48] rcu: dynamically allocate the
 rcu-kfree shrinker
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
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 david@fromorbit.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 simon.horman@corigine.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, paulmck@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-nfs@vger.kernel.org, rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 dlemoal@kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, brauner@kernel.org, tytso@mit.edu,
 gregkh@linuxfoundation.org, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBBdWcgNywgMjAyMyBhdCA3OjE34oCvQU0gUWkgWmhlbmcgPHpoZW5ncWkuYXJjaEBi
eXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IFVzZSBuZXcgQVBJcyB0byBkeW5hbWljYWxseSBhbGxv
Y2F0ZSB0aGUgcmN1LWtmcmVlIHNocmlua2VyLgo+Cj4gU2lnbmVkLW9mZi1ieTogUWkgWmhlbmcg
PHpoZW5ncWkuYXJjaEBieXRlZGFuY2UuY29tPgoKRm9yIFJDVToKUmV2aWV3ZWQtYnk6IEpvZWwg
RmVybmFuZGVzIChHb29nbGUpIDxqb2VsQGpvZWxmZXJuYW5kZXMub3JnPgoKdGhhbmtzLAoKLSBK
b2VsCgoKPiAtLS0KPiAga2VybmVsL3JjdS90cmVlLmMgfCAyMiArKysrKysrKysrKysrLS0tLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9yY3UvdHJlZS5jIGIva2VybmVsL3JjdS90cmVlLmMKPiBp
bmRleCA3Yzc5NDgwYmZhYTAuLjNiMjBmYzQ2YzUxNCAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvcmN1
L3RyZWUuYwo+ICsrKyBiL2tlcm5lbC9yY3UvdHJlZS5jCj4gQEAgLTM0NDksMTMgKzM0NDksNiBA
QCBrZnJlZV9yY3Vfc2hyaW5rX3NjYW4oc3RydWN0IHNocmlua2VyICpzaHJpbmssIHN0cnVjdCBz
aHJpbmtfY29udHJvbCAqc2MpCj4gICAgICAgICByZXR1cm4gZnJlZWQgPT0gMCA/IFNIUklOS19T
VE9QIDogZnJlZWQ7Cj4gIH0KPgo+IC1zdGF0aWMgc3RydWN0IHNocmlua2VyIGtmcmVlX3JjdV9z
aHJpbmtlciA9IHsKPiAtICAgICAgIC5jb3VudF9vYmplY3RzID0ga2ZyZWVfcmN1X3Nocmlua19j
b3VudCwKPiAtICAgICAgIC5zY2FuX29iamVjdHMgPSBrZnJlZV9yY3Vfc2hyaW5rX3NjYW4sCj4g
LSAgICAgICAuYmF0Y2ggPSAwLAo+IC0gICAgICAgLnNlZWtzID0gREVGQVVMVF9TRUVLUywKPiAt
fTsKPiAtCj4gIHZvaWQgX19pbml0IGtmcmVlX3JjdV9zY2hlZHVsZXJfcnVubmluZyh2b2lkKQo+
ICB7Cj4gICAgICAgICBpbnQgY3B1Owo+IEBAIC00OTMxLDYgKzQ5MjQsNyBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQga2ZyZWVfcmN1X2JhdGNoX2luaXQodm9pZCkKPiAgewo+ICAgICAgICAgaW50IGNw
dTsKPiAgICAgICAgIGludCBpLCBqOwo+ICsgICAgICAgc3RydWN0IHNocmlua2VyICprZnJlZV9y
Y3Vfc2hyaW5rZXI7Cj4KPiAgICAgICAgIC8qIENsYW1wIGl0IHRvIFswOjEwMF0gc2Vjb25kcyBp
bnRlcnZhbC4gKi8KPiAgICAgICAgIGlmIChyY3VfZGVsYXlfcGFnZV9jYWNoZV9maWxsX21zZWMg
PCAwIHx8Cj4gQEAgLTQ5NjIsOCArNDk1NiwxOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQga2ZyZWVf
cmN1X2JhdGNoX2luaXQodm9pZCkKPiAgICAgICAgICAgICAgICAgSU5JVF9ERUxBWUVEX1dPUkso
JmtyY3AtPnBhZ2VfY2FjaGVfd29yaywgZmlsbF9wYWdlX2NhY2hlX2Z1bmMpOwo+ICAgICAgICAg
ICAgICAgICBrcmNwLT5pbml0aWFsaXplZCA9IHRydWU7Cj4gICAgICAgICB9Cj4gLSAgICAgICBp
ZiAocmVnaXN0ZXJfc2hyaW5rZXIoJmtmcmVlX3JjdV9zaHJpbmtlciwgInJjdS1rZnJlZSIpKQo+
IC0gICAgICAgICAgICAgICBwcl9lcnIoIkZhaWxlZCB0byByZWdpc3RlciBrZnJlZV9yY3UoKSBz
aHJpbmtlciFcbiIpOwo+ICsKPiArICAgICAgIGtmcmVlX3JjdV9zaHJpbmtlciA9IHNocmlua2Vy
X2FsbG9jKDAsICJyY3Uta2ZyZWUiKTsKPiArICAgICAgIGlmICgha2ZyZWVfcmN1X3Nocmlua2Vy
KSB7Cj4gKyAgICAgICAgICAgICAgIHByX2VycigiRmFpbGVkIHRvIGFsbG9jYXRlIGtmcmVlX3Jj
dSgpIHNocmlua2VyIVxuIik7Cj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiArICAgICAgIH0K
PiArCj4gKyAgICAgICBrZnJlZV9yY3Vfc2hyaW5rZXItPmNvdW50X29iamVjdHMgPSBrZnJlZV9y
Y3Vfc2hyaW5rX2NvdW50Owo+ICsgICAgICAga2ZyZWVfcmN1X3Nocmlua2VyLT5zY2FuX29iamVj
dHMgPSBrZnJlZV9yY3Vfc2hyaW5rX3NjYW47Cj4gKyAgICAgICBrZnJlZV9yY3Vfc2hyaW5rZXIt
PnNlZWtzID0gREVGQVVMVF9TRUVLUzsKPiArCj4gKyAgICAgICBzaHJpbmtlcl9yZWdpc3Rlcihr
ZnJlZV9yY3Vfc2hyaW5rZXIpOwo+ICB9Cj4KPiAgdm9pZCBfX2luaXQgcmN1X2luaXQodm9pZCkK
PiAtLQo+IDIuMzAuMgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
