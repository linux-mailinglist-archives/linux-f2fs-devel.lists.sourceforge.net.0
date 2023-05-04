Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 843BC6F6D55
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 May 2023 15:53:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puZOn-0002EA-LB;
	Thu, 04 May 2023 13:53:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nogikh@google.com>) id 1puZOl-0002Dv-OS
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 13:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=diSEiQiFgwIgMo9GDEtvgWQfTBdTd6Sf1hxoMMcBYP0=; b=DEXV8c6s8Q2V+Zy40cWO56C/Dw
 p/jVa44U7OxJivcZ2crBpuEHTh1GirkLyhrCSN++DdFE5ABYGAXBmRVWa8/4jMaaWSZRFt7T5VRHm
 gRFdj3H9h8zN6c0+tdm8YnrFCQTD/ho03wiqq7XMp7vEXXbz8q2dvJcQaFvfhn5GpJKQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=diSEiQiFgwIgMo9GDEtvgWQfTBdTd6Sf1hxoMMcBYP0=; b=QY7MNtOwIvx9ftPVMHcl3XB+PF
 PVXb9JPx0mfygN21VhRTEE8XQFkk4kSMdIwiGdxM1n01Q8LSLGAi9ZN+vQrR++CEtNY3Xvapt62Bs
 EnLqRv62eJ842vWNKfB2mFzluTUOP5Z4qadzJy+gMLeJwyT35ZJ5MDq2OMvN96KMA0Pg=;
Received: from mail-qt1-f174.google.com ([209.85.160.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puZOi-00E2gT-ID for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 13:53:32 +0000
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-3ef36d814a5so764221cf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 04 May 2023 06:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683208402; x=1685800402;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=diSEiQiFgwIgMo9GDEtvgWQfTBdTd6Sf1hxoMMcBYP0=;
 b=YnM2H1m0PgGcfjuL9VYkbea6xR/do+cHfqCgFGFo3XnNXejrzDqmn1r7QFTlmcT6Og
 othBFqXagV1v5yzzzWCHRja8D9e5ieBH6m+26gXNh+3Ka1bcNQw0+lbjbPHwHIy0yk8u
 SBmnY0RlVIFkwbJfCHvPMZ0p9kN/JDp0QcEh7A7udMP3haLOvxGGTydzZs3sSCLT8XBW
 WZy53L7SXlQEm8lqn6/hmpBmJqYcFi6Tnqa+IdX0tXxBcB+xBh4UBs29/fVPIJEuSppL
 FWpW+yOvs4+N7TYo+bhdQvkIuWwCAPyPVn+ugtcNF2Zu0BfVxWzP/ViShYYJF3Lyz1fx
 w7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683208402; x=1685800402;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=diSEiQiFgwIgMo9GDEtvgWQfTBdTd6Sf1hxoMMcBYP0=;
 b=GOnAKqCZqzB5N0gZI55Yz3m95z66mwaDJZjSkBIFR/swaALbwGhK07o8ibb54AcMAL
 Yv02AumpBCX37LvcQAf3C54a8F4zXSyxuvNV2OfKfN+P+k51sLMuB/AL8gxIbXUKQ/8n
 4DMsXF29uYUliwQ7d6SQCDs7L62XlZCYpBcOQ8zaQv15vAkHiSajocffIIxrTv+li6VW
 2me/Wbwb0SXUgSXIEW14qFi1eCZwnhtOY/w23oHhvgNVJgC86f9ggPKpYh2YslguaCZA
 FaKb0uqrjUUKlB9fhZVvF9UAtkXu/VPT4IV31+lWUeUbQtX5xljni8x2Fh5nKw9QaBhK
 9LHA==
X-Gm-Message-State: AC+VfDz/0IYqHQh55fD9fSsg9z1s4Q/cswa6WEyTiYIcOCnX8A6M9ABN
 87TQJWdm1Ft5D96vspuLkEPRNmSPt7s6EZ9jKqVEn+fPCjwGStqjUzA=
X-Google-Smtp-Source: ACHHUZ5UtAGgtzHyxYKa9b8zHjOj0L90pDM2500dbhfNnSWdFaCa9vlgC16gec7O6Ny1aqgPpwNCUxaJFnYLpeSksoQ=
X-Received: by 2002:a05:622a:553:b0:3ef:5008:336f with SMTP id
 m19-20020a05622a055300b003ef5008336fmr309875qtx.1.1683208402652; Thu, 04 May
 2023 06:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000032909d05fade30c8@google.com>
 <d6a26ad8-3c90-d932-d966-85414e0ae42a@kernel.org>
In-Reply-To: <d6a26ad8-3c90-d932-d966-85414e0ae42a@kernel.org>
Date: Thu, 4 May 2023 15:53:11 +0200
Message-ID: <CANp29Y4qwdptMDHA37u7eXWCC-1p7PP8d0RcdfKBUT4S=o5s_Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, May 4, 2023 at 3:48 PM Chao Yu <chao@kernel.org>
    wrote: > > Hi, > > On 2023/5/4 21:31, syzbot wrote: > > Hello, > > > > syzbot
    has tested the proposed patch but the reproducer is still trigg [...] 
 
 Content analysis details:   (-15.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
                             white-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.160.174 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
                             welcome-list
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.174 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
                             Match
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1puZOi-00E2gT-ID
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING: lock held when returning
 to user space in f2fs_write_single_data_page
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
Cc: jaegeuk@kernel.org, syzkaller-bugs@googlegroups.com,
 syzbot <syzbot+eb6201248f684e99b9f8@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBNYXkgNCwgMjAyMyBhdCAzOjQ44oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMjAyMy81LzQgMjE6MzEsIHN5emJvdCB3cm90ZToKPiA+
IEhlbGxvLAo+ID4KPiA+IHN5emJvdCBoYXMgdGVzdGVkIHRoZSBwcm9wb3NlZCBwYXRjaCBidXQg
dGhlIHJlcHJvZHVjZXIgaXMgc3RpbGwgdHJpZ2dlcmluZyBhbiBpc3N1ZToKPgo+IEl0IHNhaWQg
dGhlIHJlcHJvZHVjZXIgaXMgc3RpbGwgdHJpZ2dlcmluZyBhbiBpc3N1ZSwgaG93ZXZlciwgdGhl
cmUgaXMKPiBubyBlcnJvciBvdXRwdXQgZnJvbSB0aGUgdGVzdC4KPgo+IENvdWxkIHlvdSBwbGVh
c2UgaGVscCB0byBjaGVjayB3aGV0aGVyIHN1Y2ggc3RhdHVzIGlzIG5vcm1hbCBvciBub3QsIG9y
Cj4gYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KClRoZSBzdGF0dXMgbWVhbnMgdGhhdCBzeXpib3Qg
aGFzIG5vdCByZWNlaXZlZCBhIHNpbmdsZSBieXRlIGZyb20gdGhlClZNIGZvciA1IG1pbnV0ZXMg
aW4gYSByb3csIGkuZS4gdGhlIGtlcm5lbCBsaWtlbHkganVzdCBodW5nLgoKLS0gCkFsZWtzYW5k
cgoKPgo+IFRoYW5rcywKPgo+ID4gbm8gb3V0cHV0IGZyb20gdGVzdCBtYWNoaW5lCj4gPgo+ID4K
PiA+Cj4gPiBUZXN0ZWQgb246Cj4gPgo+ID4gY29tbWl0OiAgICAgICAgIDJhZGI4NzJkIGYyZnM6
IGZpeCBwb3RlbnRpYWwgZGVhZGxvY2sgZHVlIHRvIHVucGFpcmVkIC4uCj4gPiBnaXQgdHJlZTog
ICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2hh
by9saW51eC5naXQgZGV2LXRlc3QKPiA+IGNvbnNvbGUgb3V0cHV0OiBodHRwczovL3N5emthbGxl
ci5hcHBzcG90LmNvbS94L2xvZy50eHQ/eD0xMTRiNTMzODI4MDAwMAo+ID4ga2VybmVsIGNvbmZp
ZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PTg2ZTRlYjkxM2U5
MGQ0YjIKPiA+IGRhc2hib2FyZCBsaW5rOiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9i
dWc/ZXh0aWQ9ZWI2MjAxMjQ4ZjY4NGU5OWI5ZjgKPiA+IGNvbXBpbGVyOiAgICAgICBEZWJpYW4g
Y2xhbmcgdmVyc2lvbiAxNS4wLjcsIEdOVSBsZCAoR05VIEJpbnV0aWxzIGZvciBEZWJpYW4pIDIu
MzUuMgo+ID4KPiA+IE5vdGU6IG5vIHBhdGNoZXMgd2VyZSBhcHBsaWVkLgo+Cj4gLS0KPiBZb3Ug
cmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGJlY2F1c2UgeW91IGFyZSBzdWJzY3JpYmVkIHRvIHRoZSBH
b29nbGUgR3JvdXBzICJzeXprYWxsZXItYnVncyIgZ3JvdXAuCj4gVG8gdW5zdWJzY3JpYmUgZnJv
bSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBl
bWFpbCB0byBzeXprYWxsZXItYnVncyt1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tLgo+IFRv
IHZpZXcgdGhpcyBkaXNjdXNzaW9uIG9uIHRoZSB3ZWIgdmlzaXQgaHR0cHM6Ly9ncm91cHMuZ29v
Z2xlLmNvbS9kL21zZ2lkL3N5emthbGxlci1idWdzL2Q2YTI2YWQ4LTNjOTAtZDkzMi1kOTY2LTg1
NDE0ZTBhZTQyYSU0MGtlcm5lbC5vcmcuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
