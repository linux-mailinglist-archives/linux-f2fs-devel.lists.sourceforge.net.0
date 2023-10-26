Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D707D7F77
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Oct 2023 11:21:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qvwYh-0003VU-JE;
	Thu, 26 Oct 2023 09:21:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nogikh@google.com>) id 1qvwYg-0003VO-UA
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Oct 2023 09:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pZMZ4PPqKuvaUyytZN8F6rFzjVZIuTDbX7E6WtfgOoc=; b=TpYW2Oz+xwLLUrO67CtUtMfPfQ
 us7eQjG1aNNqcGBtSabAy0qRsSn6ubNCrWWZwglGkDfrBdHXkTMlwe/LiOQEqJvrwkzqPWf9K22NZ
 t+y3OloHZ8PJMQYEN0GbJaQO1IU/onS9ARqL2ZND/8FCDh5B5PWYDyuDAYpezvqDJm7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pZMZ4PPqKuvaUyytZN8F6rFzjVZIuTDbX7E6WtfgOoc=; b=N5Dfhk98ZSIFgZ50PlLlOpyp5x
 iWR/JO+l7QWiby4RWtoM+ehF2CnKGINmv/QPxOLqGl1xZ++MVVG0osuUgMQj84TPrgXazVxOznSrH
 /mxjMx2KfW/J3aQn7OitcOhEbnNB1EwczV1BCCfLHeLbYc4qguXZaYz6e55vbHwHZ67U=;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qvwYd-0006Bk-JX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Oct 2023 09:21:41 +0000
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1c9d4f08d7cso140015ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 26 Oct 2023 02:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698312094; x=1698916894;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pZMZ4PPqKuvaUyytZN8F6rFzjVZIuTDbX7E6WtfgOoc=;
 b=1hy/YtwP3yX+E/AnVeqkV1tlZNoG/JCNpp7yhxppTduSHpoA2PfSmM/Fa2Csm7Hh7a
 aMZEB1VXqcNHTFiWefBPqFHZKXZ6tK3FVlgoIh6yP90RXmY2/Ba3RAcczbDFn6sqBrTF
 gri+7w/1X+KhgRJ35+M2/EZPuFQ/Bu6JwGWfIbxgbeVY8Yz0LrxlN519GBhuRY1AQbDZ
 oRMPX2YDeK3ofaE82iR5UQghTzzCoFOiS4wwCjENoZ4uPi6ajcInKLR0W3ClYZzXBMVO
 J3FNxk4QQ580weopPAKFxP02mDtHWa1ppAJHZLWwMXxXy495g5ErOBh56Gu2ZNmNCmS1
 4rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312094; x=1698916894;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pZMZ4PPqKuvaUyytZN8F6rFzjVZIuTDbX7E6WtfgOoc=;
 b=gd2oe8UgbFW0YDu0jvzgFWZRrsWCeX3ssTUYtnOJ9uthf3mymesg2gmG32EtDCr2hM
 wQD9BjYDLodu4cE/+/SXp70wVoKfbOHfXCbi+YheMUCN0sTJhhcenuvRH16Xu4OAmQ4D
 lcS3iBDwMi7wkUJQovfo87KrhBeYJtihr+pB4y5XZwpgSxZ+Cv9mS0EQilhYgJvwYHhp
 VkWTCailjJN8Ldlie909THC2lS5/8gGydnTXsUD/uSouYtNmDwG+tXloK4Rh8OM8dR4M
 Nam8vGdbjqcpJLBW+79dELqh3CJFLALLBPVM3Cgn0ut4GdYXNZVwVd5vH5D3wF9fJWJm
 1Cdw==
X-Gm-Message-State: AOJu0Ywao8gvNKW4cibjZZ4IWQKVIM+98GvO9FO6vUQ7wnqK6UqxXDrb
 TVjRa3Swuep2rPOUg0m2Agy5cDTXeRpwDdx/FwpZtw==
X-Google-Smtp-Source: AGHT+IErCd6aP8iwtmE/F3hCl2wzy53K0Ir6Imof+twmkHwphD9ClXmtrVHybhDQN1tU8IUIk51ZAULDc4AINetRPX8=
X-Received: by 2002:a17:903:28c:b0:1c9:e229:f5ec with SMTP id
 j12-20020a170903028c00b001c9e229f5ecmr427638plr.22.1698312093726; Thu, 26 Oct
 2023 02:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000000f188605ffdd9cf8@google.com>
 <00000000000017dd680608991d75@google.com>
In-Reply-To: <00000000000017dd680608991d75@google.com>
Date: Thu, 26 Oct 2023 11:21:21 +0200
Message-ID: <CANp29Y4kNfuBK6LxU5nAHwA8wGqGYK9EJ-uBFef70s=AEbNP0g@mail.gmail.com>
To: syzbot <syzbot+a4976ce949df66b1ddf1@syzkaller.appspotmail.com>
X-Spam-Score: -13.2 (-------------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  For some still unknown reason, syzbot's bisections of fs bugs
    sometimes end up in drm. There've been quite a few such cases already.. Please
    ignore this bot's message. On Thu, Oct 26, 2023 at 8:59 AM syzbot <syzbot+a4976ce949df66b1ddf1@syzkaller.appspotmail.com>
    wrote: > > syzbot suspects this issue was fixed by commit: > > commit a0e6a017ab56936c0405fe914a793b241
    [...] 
 
 Content analysis details:   (-13.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.214.180 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.214.180 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
                             welcome-list
  2.5 SORTED_RECIPS          Recipient list is sorted by address
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
                             welcome-list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
                             Match
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qvwYd-0006Bk-JX
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in
 f2fs_add_inline_entry
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
Cc: hdanton@sina.com, mcanal@igalia.com, penguin-kernel@i-love.sakura.ne.jp,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, lizhi.xu@windriver.com,
 mairacanal@riseup.net, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 arthurgrillo@riseup.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Rm9yIHNvbWUgc3RpbGwgdW5rbm93biByZWFzb24sIHN5emJvdCdzIGJpc2VjdGlvbnMgb2YgZnMg
YnVncwpzb21ldGltZXMgZW5kIHVwIGluIGRybS4gVGhlcmUndmUgYmVlbiBxdWl0ZSBhIGZldyBz
dWNoIGNhc2VzCmFscmVhZHkuLgoKUGxlYXNlIGlnbm9yZSB0aGlzIGJvdCdzIG1lc3NhZ2UuCgoK
T24gVGh1LCBPY3QgMjYsIDIwMjMgYXQgODo1OeKAr0FNIHN5emJvdAo8c3l6Ym90K2E0OTc2Y2U5
NDlkZjY2YjFkZGYxQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20+IHdyb3RlOgo+Cj4gc3l6Ym90
IHN1c3BlY3RzIHRoaXMgaXNzdWUgd2FzIGZpeGVkIGJ5IGNvbW1pdDoKPgo+IGNvbW1pdCBhMGU2
YTAxN2FiNTY5MzZjMDQwNWZlOTE0YTc5M2IyNDFlZDI1ZWUwCj4gQXV0aG9yOiBNYcOtcmEgQ2Fu
YWwgPG1jYW5hbEBpZ2FsaWEuY29tPgo+IERhdGU6ICAgVHVlIE1heSAyMyAxMjozMjowOCAyMDIz
ICswMDAwCj4KPiAgICAgZHJtL3ZrbXM6IEZpeCByYWNlLWNvbmRpdGlvbiBiZXR3ZWVuIHRoZSBo
cnRpbWVyIGFuZCB0aGUgYXRvbWljIGNvbW1pdAo+Cj4gYmlzZWN0aW9uIGxvZzogIGh0dHBzOi8v
c3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvYmlzZWN0LnR4dD94PTE2NmMwOTBkNjgwMDAwCj4gc3Rh
cnQgY29tbWl0OiAgIDI4ZjIwYTE5Mjk0ZCBNZXJnZSB0YWcgJ3g4Ni11cmdlbnQtMjAyMy0wOC0y
Nicgb2YgZ2l0Oi8vZ2kuLgo+IGdpdCB0cmVlOiAgICAgICB1cHN0cmVhbQo+IGtlcm5lbCBjb25m
aWc6ICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94Ly5jb25maWc/eD0yMWE1NzgwOTJk
ZDYxZDA1Cj4gZGFzaGJvYXJkIGxpbms6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1
Zz9leHRpZD1hNDk3NmNlOTQ5ZGY2NmIxZGRmMQo+IHN5eiByZXBybzogICAgICBodHRwczovL3N5
emthbGxlci5hcHBzcG90LmNvbS94L3JlcHJvLnN5ej94PTE1YTA5MzQwNjgwMDAwCj4gQyByZXBy
b2R1Y2VyOiAgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwcm8uYz94PTExODkw
OWViYTgwMDAwCj4KPiBJZiB0aGUgcmVzdWx0IGxvb2tzIGNvcnJlY3QsIHBsZWFzZSBtYXJrIHRo
ZSBpc3N1ZSBhcyBmaXhlZCBieSByZXBseWluZyB3aXRoOgo+Cj4gI3N5eiBmaXg6IGRybS92a21z
OiBGaXggcmFjZS1jb25kaXRpb24gYmV0d2VlbiB0aGUgaHJ0aW1lciBhbmQgdGhlIGF0b21pYyBj
b21taXQKPgo+IEZvciBpbmZvcm1hdGlvbiBhYm91dCBiaXNlY3Rpb24gcHJvY2VzcyBzZWU6IGh0
dHBzOi8vZ29vLmdsL3Rwc21FSiNiaXNlY3Rpb24KPgo+IC0tCj4gWW91IHJlY2VpdmVkIHRoaXMg
bWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2NyaWJlZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAi
c3l6a2FsbGVyLWJ1Z3MiIGdyb3VwLgo+IFRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBh
bmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQgYW4gZW1haWwgdG8gc3l6a2Fs
bGVyLWJ1Z3MrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbS4KPiBUbyB2aWV3IHRoaXMgZGlz
Y3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dp
ZC9zeXprYWxsZXItYnVncy8wMDAwMDAwMDAwMDAxN2RkNjgwNjA4OTkxZDc1JTQwZ29vZ2xlLmNv
bS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
