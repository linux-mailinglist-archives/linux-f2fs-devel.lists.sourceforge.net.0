Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D92E76D002
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 16:27:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRCoq-0004SJ-05;
	Wed, 02 Aug 2023 14:27:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nogikh@google.com>) id 1qRCon-0004SC-Hm
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 14:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n7NE4BqcxOTAM1FXdBRtUyCLd0auS/l4RfesziLuyeU=; b=QZ8UVIe1WlaA03dG/5+81aTMvY
 8bWJaVImbPs4uzX2BE9oHEWcB0FYHjNdmcuYfFia1c1tjZDQNJmykXhKZ7nD907D8t06axhJSgaPv
 n+rgm18TLXbt+/GCUtoCRp2+1oLqidVic3X10uR8PrLp0Q3AVuy4+tfOYEBmTB5Dk9jg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n7NE4BqcxOTAM1FXdBRtUyCLd0auS/l4RfesziLuyeU=; b=OsxKiLQJmsy9uJGltQhquGfpBY
 D5YpDEfl2YjLPtiZfBCeOlBT+LTFwF8tPQWTfe3LOp65mj/2Yobo6CMVDJ5GOIFh5EBVNn6zLAxav
 Fxax8qN6aWcnDqfwaktE4C0ixitDetTV3BQ8KElDtK/M0bpWaJFElfwgBLXGIatnuBww=;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qRCoj-00Ao5J-Bd for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 14:27:17 +0000
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-3fe1e44fd2bso102955e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Aug 2023 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690986427; x=1691591227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n7NE4BqcxOTAM1FXdBRtUyCLd0auS/l4RfesziLuyeU=;
 b=w3+G/MlFOQ4FCLai9RRniwpTTBXS9EUQi9tdWYIztNtf7PWUPb2RSj+dfp7fUKo6a1
 5jrqOxExWvN8aEHWc3E+9pAr3jTb/aK4TYnqDlmIBqGTIOP9ih0YbzgErTYajSHP5XWA
 +1pzMcTNXPtcA9+k3het2rZ3ysB7ejSMIdWtLvUvoBaqPt2pHiRiJOgBNH0Yrn+G8PEe
 Hy0yILIkNTvCxt6uihI0H2iEYHnyjo6L2CKU0hOfUlZ/+xdA6wXevJJWS6skHEaFn3dn
 d96bbJdZD2akyGY9BlDqxsBFOFBPlmCVc6q+0gMualvtlQ86q58y7cCJIaPJa5mX4e+b
 DlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690986427; x=1691591227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n7NE4BqcxOTAM1FXdBRtUyCLd0auS/l4RfesziLuyeU=;
 b=KmmWJtEMmTY7PQjmkOXormyIuslk3jzudHjMfyAmyiw60OepZApW+FUVXi8TgpZl/z
 UfpaGN/9p4ARYan+tymfyXIpc+5DlkajRN7U7D2HEwoUyB3GPZqiyPScoTVUY0q6PQeb
 JVMZvrP0V8cZwOR9JMTWb04DfdUrg19c9FXWf5NN/bzwqqjc/mK8ZBTL13AKSzKA7v0W
 vyb3KDGn51DhDWPSM+fLGiAU6/UsZfQbtfFwT9hya1vIhDey40jYrs9qkn+f9d8HiCG4
 FkVC6l6VVleePOGt7pGbrjSr91v9LMrzwPpdqBXp+ke5yKlEexcIyS53satKYNmQkuZV
 PXRw==
X-Gm-Message-State: ABy/qLZwwECplpuEaNAkAj2l7VDpcR9uk7mlDoc8g/P77vBbmnPmFloF
 Ursdp2UWSRb1vQX1p2hp4e4ex4VX/I7NcH36S05m5g==
X-Google-Smtp-Source: APBJJlGdKDlmTdjAVJFjYw+jb6H3+upJ/VfB7N/IyLinOQZAGY3YKZ7Q/5RLmI7ogwSKbkCk2ZCzzgHV51lf7ytXuRM=
X-Received: by 2002:a05:600c:1f0a:b0:3f7:e59f:2183 with SMTP id
 bd10-20020a05600c1f0a00b003f7e59f2183mr358065wmb.5.1690986426694; Wed, 02 Aug
 2023 07:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000af3d3105ff38ee3c@google.com>
 <00000000000099695a0601e5ecfb@google.com>
In-Reply-To: <00000000000099695a0601e5ecfb@google.com>
Date: Wed, 2 Aug 2023 16:26:54 +0200
Message-ID: <CANp29Y4RFKPWBv+=ExNtud=CR2sAPR29H-KxV7R+HSiwjh3GvA@mail.gmail.com>
To: syzbot <syzbot+f4649be1be739e030111@syzkaller.appspotmail.com>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Aug 2, 2023 at 2:41 AM syzbot <syzbot+f4649be1be739e030111@syzkaller.appspotmail.com>
    wrote: > > syzbot suspects this issue was fixed by commit: > > commit 458c15dfbce62c35fefd9ca637b20a0513
    [...] 
 
 Content analysis details:   (-15.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.51 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.51 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
                             welcome-list
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
                             white-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
                             Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qRCoj-00Ao5J-Bd
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] general protection fault in
 f2fs_drop_extent_tree
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
From: Aleksandr Nogikh via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Aleksandr Nogikh <nogikh@google.com>
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBBdWcgMiwgMjAyMyBhdCAyOjQx4oCvQU0gc3l6Ym90CjxzeXpib3QrZjQ2NDliZTFi
ZTczOWUwMzAxMTFAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbT4gd3JvdGU6Cj4KPiBzeXpib3Qg
c3VzcGVjdHMgdGhpcyBpc3N1ZSB3YXMgZml4ZWQgYnkgY29tbWl0Ogo+Cj4gY29tbWl0IDQ1OGMx
NWRmYmNlNjJjMzVmZWZkOWNhNjM3YjIwYTA1MTMwOWM5ZjEKPiBBdXRob3I6IENoYW8gWXUgPGNo
YW9Aa2VybmVsLm9yZz4KPiBEYXRlOiAgIFR1ZSBNYXkgMjMgMDM6NTg6MjIgMjAyMyArMDAwMAo+
Cj4gICAgIGYyZnM6IGRvbid0IHJlc2V0IHVuY2hhbmdhYmxlIG1vdW50IG9wdGlvbiBpbiBmMmZz
X3JlbW91bnQoKQo+Cj4gYmlzZWN0aW9uIGxvZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3Qu
Y29tL3gvYmlzZWN0LnR4dD94PTEyNDYxZDMxYTgwMDAwCj4gc3RhcnQgY29tbWl0OiAgIGE5MmI3
ZDI2Yzc0MyBNZXJnZSB0YWcgJ2RybS1maXhlcy0yMDIzLTA2LTIzJyBvZiBnaXQ6Ly9hbm8uLgo+
IGdpdCB0cmVlOiAgICAgICB1cHN0cmVhbQo+IGtlcm5lbCBjb25maWc6ICBodHRwczovL3N5emth
bGxlci5hcHBzcG90LmNvbS94Ly5jb25maWc/eD0yY2JkMjk4ZDBhZmYxMTQwCj4gZGFzaGJvYXJk
IGxpbms6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD1mNDY0OWJlMWJl
NzM5ZTAzMDExMQo+IHN5eiByZXBybzogICAgICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNv
bS94L3JlcHJvLnN5ej94PTE1NjRhZmIwYTgwMDAwCj4gQyByZXByb2R1Y2VyOiAgIGh0dHBzOi8v
c3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwcm8uYz94PTE2NjkyOGM3MjgwMDAwCj4KPiBJZiB0
aGUgcmVzdWx0IGxvb2tzIGNvcnJlY3QsIHBsZWFzZSBtYXJrIHRoZSBpc3N1ZSBhcyBmaXhlZCBi
eSByZXBseWluZyB3aXRoOgo+Cj4gI3N5eiBmaXg6IGYyZnM6IGRvbid0IHJlc2V0IHVuY2hhbmdh
YmxlIG1vdW50IG9wdGlvbiBpbiBmMmZzX3JlbW91bnQoKQoKTG9va3MgcmVhc29uYWJsZS4KI3N5
eiBmaXg6IGYyZnM6IGRvbid0IHJlc2V0IHVuY2hhbmdhYmxlIG1vdW50IG9wdGlvbiBpbiBmMmZz
X3JlbW91bnQoKQoKPgo+IEZvciBpbmZvcm1hdGlvbiBhYm91dCBiaXNlY3Rpb24gcHJvY2VzcyBz
ZWU6IGh0dHBzOi8vZ29vLmdsL3Rwc21FSiNiaXNlY3Rpb24KPgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
