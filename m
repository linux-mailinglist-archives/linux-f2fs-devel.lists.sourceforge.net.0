Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E50B688C358
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Mar 2024 14:27:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rp6pP-00085u-T2;
	Tue, 26 Mar 2024 13:27:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yizhan@redhat.com>) id 1rp6pO-00085o-SS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Mar 2024 13:26:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KHgAIu9Qni0T7nNxSUpgWLrDzwIAomPgMIaz+Kf9mws=; b=B1UdNVzLchw4TKk3leNYzPpCM4
 Z8v7GDybqIP/L79q56RZnt7UYMqJabptuB1wOwvCOsnNmvO6fCMDS7vEJ1Vbi5l2GMUa9WlSImmsD
 RXoG4SFpPoxqz28I/ZkU8zl4WWs7D4tWUNjv5lBrfvb9KEIiC6JsIUJC37PT/9/bkDrM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KHgAIu9Qni0T7nNxSUpgWLrDzwIAomPgMIaz+Kf9mws=; b=ZcuAGp59+F44OPtTmoy6FCRi3G
 SAzvJkwh4bdQ9sY5CerXQcOIbyTMIb2+7oVkd0zjx9EXkEUN6TF4erYSOlL7CBqWviVsvL5ycQ38g
 uh9cqkcXssSE8mxrWeZ7faoFkXtvtVCJgf/7VyBhLtX4GtDcCb/SQ6AzKr713APhnxc0=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rp6pL-00014i-2C for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Mar 2024 13:26:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711459603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHgAIu9Qni0T7nNxSUpgWLrDzwIAomPgMIaz+Kf9mws=;
 b=d+bEzsjJ7tn0+4TrI3sLGynsrPucUr5B8qV0I6PwIJsUgxmfsVGgzeemS8fG6keQlJF2I9
 25yloRVtV26wiOKyXtpL2WeRdlOWfTnQIe9gVsn9gpEx32DpcUpIMaFFyotW4bLcmpXWJ+
 uvX8YTfP9fuccE6lvGpmEipdYkVkjuI=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-fqa2yddDNYqWcj63abQ47g-1; Tue, 26 Mar 2024 09:26:42 -0400
X-MC-Unique: fqa2yddDNYqWcj63abQ47g-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2a039b47c5fso2885876a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Mar 2024 06:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711459601; x=1712064401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KHgAIu9Qni0T7nNxSUpgWLrDzwIAomPgMIaz+Kf9mws=;
 b=ouZ56T1TnzsNHGSXdEIj/gTU1Cyro5H2h6QFTuyE3LCtj0s6w12v6jlYR5bNXlHfCb
 1+om6bYJL8puoBBgkiTeURt7M65Mj295MGuNCI9N3S9bdxlQdaI15Dr2fH/ySkbyrAq4
 3PSZAZxnSD44X1xMV41JZqPYX8TttJgzsqZ0trU22moQ0J0WUO8hIv1x8I7ExbWRe0UU
 8EOef8SDmxsW7jHFwuwGzZknRwcL9QetqF/mSI6InttN9C5aJqrUKny95lj0oo1/Si2h
 MbyG55ju3azAJEB6+tGYnWaeo+Gs3oyAeDeT0YWj/So3oBgVHM7RalE0uYrH0VCMsxfz
 LbXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsSNzRAnviPiDNS06wN/5miJzXd/xrEo8SMduU4Fe5+Y5yAVsg2U8p1tQ4s1kOwC6kRevKBeIkKZ3e6eXcUpQzxM7yJ3FNkKiYDIBw48aiWP1SyK+c0w==
X-Gm-Message-State: AOJu0YwA9KT810iLwb65uPirT2dmZ38rgcuzpbhVPN+cP0/cjWMaJCR8
 ovYW0ZmsVvI42EGhbfu5FIKKREv3PPsxoFco6xHLChYNAvX/knYjfeoW2rqIDNYbrlF9JqSe9zN
 om0EIr5TDQPzIzrzuSnjicK9PgthHhI300AqCbpMFqdaEvMfYypYZd6JGJvPsn8/sAo8BPWTKLy
 m1Hf/fZgUKTapKQ8PkujSD72GxCz1SJOQNLfvJ5QAMGw3f/80tsQ==
X-Received: by 2002:a17:90b:4b11:b0:2a0:8ccf:b45a with SMTP id
 lx17-20020a17090b4b1100b002a08ccfb45amr1580473pjb.4.1711459601368; 
 Tue, 26 Mar 2024 06:26:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZMKSXNV7j3EUgkns9zCxvY3LF6mJLJfu5ZwmEvnMvWqryBaGLJJAnYbgwCL0IzNiZ1nVIMC2cmuvD9udHvtI=
X-Received: by 2002:a17:90b:4b11:b0:2a0:8ccf:b45a with SMTP id
 lx17-20020a17090b4b1100b002a08ccfb45amr1580447pjb.4.1711459600942; Tue, 26
 Mar 2024 06:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240325152623.797099-1-chao@kernel.org>
In-Reply-To: <20240325152623.797099-1-chao@kernel.org>
From: Yi Zhang <yi.zhang@redhat.com>
Date: Tue, 26 Mar 2024 21:26:28 +0800
Message-ID: <CAHj4cs8vWQ2YRTKKETWX5sJduYO1BJ8NPSwo8mw3LqqRfsns1g@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  I confirmed the issue was fixed now, thanks. Tested-by: Yi
    Zhang <yi.zhang@redhat.com> On Mon, Mar 25, 2024 at 11:26 PM Chao Yu <chao@kernel.org>
    wrote: > > As reported by Yi Zhang in mailing list [1], kernel warning was
    catched > during zbd/010 test as below: > > ./check zbd/010 > zb [...] 
 
 Content analysis details:   (-0.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [170.10.133.124 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
                             [170.10.133.124 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rp6pL-00014i-2C
Subject: Re: [f2fs-dev] [PATCH] f2fs: multidev: fix to recognize valid zero
 block address
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
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SSBjb25maXJtZWQgdGhlIGlzc3VlIHdhcyBmaXhlZCBub3csIHRoYW5rcy4KClRlc3RlZC1ieTog
WWkgWmhhbmcgPHlpLnpoYW5nQHJlZGhhdC5jb20+CgpPbiBNb24sIE1hciAyNSwgMjAyNCBhdCAx
MToyNuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBBcyByZXBvcnRl
ZCBieSBZaSBaaGFuZyBpbiBtYWlsaW5nIGxpc3QgWzFdLCBrZXJuZWwgd2FybmluZyB3YXMgY2F0
Y2hlZAo+IGR1cmluZyB6YmQvMDEwIHRlc3QgYXMgYmVsb3c6Cj4KPiAuL2NoZWNrIHpiZC8wMTAK
PiB6YmQvMDEwICh0ZXN0IGdhcCB6b25lIHN1cHBvcnQgd2l0aCBGMkZTKSAgICAgICAgICAgICAg
ICAgICAgW2ZhaWxlZF0KPiAgICAgcnVudGltZSAgICAuLi4gIDMuNzUycwo+ICAgICBzb21ldGhp
bmcgZm91bmQgaW4gZG1lc2c6Cj4gICAgIFsgNDM3OC4xNDY3ODFdIHJ1biBibGt0ZXN0cyB6YmQv
MDEwIGF0IDIwMjQtMDItMTggMTE6MzE6MTMKPiAgICAgWyA0Mzc4LjE5MjM0OV0gbnVsbF9ibGs6
IG1vZHVsZSBsb2FkZWQKPiAgICAgWyA0Mzc4LjIwOTg2MF0gbnVsbF9ibGs6IGRpc2sgbnVsbGIw
IGNyZWF0ZWQKPiAgICAgWyA0Mzc4LjQxMzI4NV0gc2NzaV9kZWJ1ZzpzZGVidWdfZHJpdmVyX3By
b2JlOiBzY3NpX2RlYnVnOiB0cmltCj4gcG9sbF9xdWV1ZXMgdG8gMC4gcG9sbF9xL25yX2h3ID0g
KDAvMSkKPiAgICAgWyA0Mzc4LjQyMjMzNF0gc2NzaSBob3N0MTU6IHNjc2lfZGVidWc6IHZlcnNp
b24gMDE5MSBbMjAyMTA1MjBdCj4gICAgICAgICAgICAgICAgICAgICAgZGV2X3NpemVfbWI9MTAy
NCwgb3B0cz0weDAsIHN1Ym1pdF9xdWV1ZXM9MSwgc3RhdGlzdGljcz0wCj4gICAgIFsgNDM3OC40
MzQ5MjJdIHNjc2kgMTU6MDowOjA6IERpcmVjdC1BY2Nlc3MtWkJDIExpbnV4Cj4gc2NzaV9kZWJ1
ZyAgICAgICAwMTkxIFBROiAwIEFOU0k6IDcKPiAgICAgWyA0Mzc4LjQ0MzM0M10gc2NzaSAxNTow
OjA6MDogUG93ZXItb24gb3IgZGV2aWNlIHJlc2V0IG9jY3VycmVkCj4gICAgIFsgNDM3OC40NDkz
NzFdIHNkIDE1OjA6MDowOiBBdHRhY2hlZCBzY3NpIGdlbmVyaWMgc2c1IHR5cGUgMjAKPiAgICAg
WyA0Mzc4LjQ0OTQxOF0gc2QgMTU6MDowOjA6IFtzZGZdIEhvc3QtbWFuYWdlZCB6b25lZCBibG9j
ayBkZXZpY2UKPiAgICAgLi4uCj4gICAgIChTZWUgJy9tbnQvdGVzdHMvZ2l0bGFiLmNvbS9hcGkv
djQvcHJvamVjdHMvMTkxNjgxMTYvcmVwb3NpdG9yeS9hcmNoaXZlLnppcC9zdG9yYWdlL2Jsa3Rl
c3RzL2Jsay9ibGt0ZXN0cy9yZXN1bHRzL25vZGV2L3piZC8wMTAuZG1lc2cnCj4KPiBXQVJOSU5H
OiBDUFU6IDIyIFBJRDogNDQwMTEgYXQgZnMvaW9tYXAvaXRlci5jOjUxCj4gQ1BVOiAyMiBQSUQ6
IDQ0MDExIENvbW06IGZpbyBOb3QgdGFpbnRlZCA2LjguMC1yYzMrICMxCj4gUklQOiAwMDEwOmlv
bWFwX2l0ZXIrMHgzMmIvMHgzNTAKPiBDYWxsIFRyYWNlOgo+ICA8VEFTSz4KPiAgX19pb21hcF9k
aW9fcncrMHgxZGYvMHg4MzAKPiAgZjJmc19maWxlX3JlYWRfaXRlcisweDE1Ni8weDNkMCBbZjJm
c10KPiAgYWlvX3JlYWQrMHgxMzgvMHgyMTAKPiAgaW9fc3VibWl0X29uZSsweDE4OC8weDhjMAo+
ICBfX3g2NF9zeXNfaW9fc3VibWl0KzB4OGMvMHgxYTAKPiAgZG9fc3lzY2FsbF82NCsweDg2LzB4
MTcwCj4gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDZlLzB4NzYKPgo+IFNoaW5p
Y2hpcm8gS2F3YXNha2kgaGVscHMgdG8gYW5hbHlzZSB0aGlzIGlzc3VlIGFuZCBwcm9wb3NlcyBh
IHBvdGVudGlhbAo+IGZpeGluZyBwYXRjaCBpbiBbMl0uCj4KPiBRdW90ZWQgZnJvbSByZXBseSBv
ZiBTaGluaWNoaXJvIEthd2FzYWtpOgo+Cj4gIkkgY29uZmlybWVkIHRoYXQgdGhlIHRyaWdnZXIg
Y29tbWl0IGlzIGRiZjhlNjNmNDhhZiBhcyBZaSByZXBvcnRlZC4gSSB0b29rIGEKPiBsb29rIGlu
IHRoZSBjb21taXQsIGJ1dCBpdCBsb29rcyBmaW5lIHRvIG1lLiBTbyBJIHRob3VnaHQgdGhlIGNh
dXNlIGlzIG5vdAo+IGluIHRoZSBjb21taXQgZGlmZi4KPgo+IEkgZm91bmQgdGhlIFdBUk4gaXMg
cHJpbnRlZCB3aGVuIHRoZSBmMmZzIGlzIHNldCB1cCB3aXRoIG11bHRpcGxlIGRldmljZXMsCj4g
YW5kIHJlYWQgcmVxdWVzdHMgYXJlIG1hcHBlZCB0byB0aGUgdmVyeSBmaXJzdCBibG9jayBvZiB0
aGUgc2Vjb25kIGRldmljZSBpbiB0aGUKPiBkaXJlY3QgcmVhZCBwYXRoLiBJbiB0aGlzIGNhc2Us
IGYyZnNfbWFwX2Jsb2NrcygpIGFuZCBmMmZzX21hcF9ibG9ja3NfY2FjaGVkKCkKPiBtb2RpZnkg
bWFwLT5tX3BibGsgYXMgdGhlIHBoeXNpY2FsIGJsb2NrIGFkZHJlc3MgZnJvbSBlYWNoIGJsb2Nr
IGRldmljZS4gSXQKPiBiZWNvbWVzIHplcm8gd2hlbiBpdCBpcyBtYXBwZWQgdG8gdGhlIGZpcnN0
IGJsb2NrIG9mIHRoZSBkZXZpY2UuIEhvd2V2ZXIsCj4gZjJmc19pb21hcF9iZWdpbigpIGFzc3Vt
ZXMgdGhhdCBtYXAtPm1fcGJsayBpcyB0aGUgcGh5c2ljYWwgYmxvY2sgYWRkcmVzcyBvZiB0aGUK
PiB3aG9sZSBmMmZzLCBhY3Jvc3MgdGhlIGFsbCBibG9jayBkZXZpY2VzLiBJdCBjb21wYXJlcyBt
YXAtPm1fcGJsayBhZ2FpbnN0Cj4gTlVMTF9BRERSID09IDAsIHRoZW4gZ28gaW50byB0aGUgdW5l
eHBlY3RlZCBicmFuY2ggYW5kIHNldHMgdGhlIGludmFsaWQKPiBpb21hcC0+bGVuZ3RoLiBUaGUg
V0FSTiBjYXRjaGVzIHRoZSBpbnZhbGlkIGlvbWFwLT5sZW5ndGguCj4KPiBUaGlzIFdBUk4gaXMg
cHJpbnRlZCBldmVuIGZvciBub24tem9uZWQgYmxvY2sgZGV2aWNlcywgYnkgZm9sbG93aW5nIHN0
ZXBzLgo+Cj4gIC0gQ3JlYXRlIHR3byAobm9uLXpvbmVkKSBudWxsX2JsayBkZXZpY2VzIG1lbW9y
eSBiYWNrZWQgd2l0aCAxMjhNQiBzaXplIGVhY2g6Cj4gICAgbnVsbGIwIGFuZCBudWxsYjEuCj4g
ICMgbWtmcy5mMmZzIC9kZXYvbnVsbGIwIC1jIC9kZXYvbnVsbGIxCj4gICMgbW91bnQgLXQgZjJm
cyAvZGV2L251bGxiMCAiJHttb3VudF9kaXJ9Igo+ICAjIGRkIGlmPS9kZXYvemVybyBvZj0iJHtt
b3VudF9kaXJ9L3Rlc3QuZGF0IiBicz0xTSBjb3VudD0xOTIKPiAgIyBkZCBpZj0iJHttb3VudF9k
aXJ9L3Rlc3QuZGF0IiBvZj0vZGV2L251bGwgYnM9MU0gY291bnQ9MTkyIGlmbGFnPWRpcmVjdAo+
Cj4gLi4uIgo+Cj4gU28sIHRoZSByb290IGNhdXNlIG9mIHRoaXMgaXNzdWUgaXM6IHdoZW4gbXVs
dGktZGV2aWNlcyBmZWF0dXJlIGlzIG9uLAo+IGYyZnNfbWFwX2Jsb2NrcygpIG1heSByZXR1cm4g
emVybyBibGthZGRyIGluIG5vbi1wcmltYXJ5IGRldmljZSwgd2hpY2ggaXMKPiBhIHZlcmlmaWVk
IHZhbGlkIGJsb2NrIGFkZHJlc3MsIGhvd2V2ZXIsIGYyZnNfaW9tYXBfYmVnaW4oKSB0cmVhdHMg
aXQgYXMKPiBhbiBpbnZhbGlkIGJsb2NrIGFkZHJlc3MsIGFuZCB0aGVuIGl0IHRyaWdnZXJzIHRo
ZSB3YXJuaW5nIGluIGlvbWFwCj4gZnJhbWV3b3JrIGNvZGUuCj4KPiBGaW5hbGx5LCBhcyBkaXNj
dXNzZWQsIHdlIGRlY2lkZSB0byB1c2UgYSBtb3JlIHNpbXBsZSBhbmQgZGlyZWN0IHdheSB0aGF0
Cj4gY2hlY2tpbmcgKG1hcC5tX2ZsYWdzICYgRjJGU19NQVBfTUFQUEVEKSBjb25kaXRpb24gaW5z
dGVhZCBvZgo+IChtYXAubV9wYmxrICE9IE5VTExfQUREUikgdG8gZml4IHRoaXMgaXNzdWUuCj4K
PiBUaGFua3MgYSBsb3QgZm9yIHRoZSBlZmZvcnQgb2YgWWkgWmhhbmcgYW5kIFNoaW5pY2hpcm8g
S2F3YXNha2kgb24gdGhpcwo+IGlzc3VlLgo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LWYyZnMtZGV2ZWwvQ0FIajRjcy1rZm9qWUM5aTBHNzNQUmtZemN4Q1RleD0tdnVnUkZl
UDQwZ19VUkd2bmZRQG1haWwuZ21haWwuY29tLwo+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1mMmZzLWRldmVsL2duZ2RqNzdrNHBpY2Fnc2ZkdGlhYTdncGdudXA2ZnNnd3pzbHR4
Nm1pbG1oZWdtamZmQGlheDJuNHd2cnF5ZS8KPgo+IFJlcG9ydGVkLWJ5OiBZaSBaaGFuZyA8eWku
emhhbmdAcmVkaGF0LmNvbT4KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LWYyZnMtZGV2ZWwvQ0FIajRjcy1rZm9qWUM5aTBHNzNQUmtZemN4Q1RleD0tdnVnUkZlUDQwZ19V
Ukd2bmZRQG1haWwuZ21haWwuY29tLwo+IFRlc3RlZC1ieTogU2hpbidpY2hpcm8gS2F3YXNha2kg
PHNoaW5pY2hpcm8ua2F3YXNha2lAd2RjLmNvbT4KPiBGaXhlczogMTUxN2MxYTdhNDQ1ICgiZjJm
czogaW1wbGVtZW50IGlvbWFwIG9wZXJhdGlvbnMiKQo+IEZpeGVzOiA4ZDNjMWZhM2ZhNWUgKCJm
MmZzOiBkb24ndCByZWx5IG9uIEYyRlNfTUFQXyogaW4gZjJmc19pb21hcF9iZWdpbiIpCj4gU2ln
bmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+IC0tLQo+ICBmcy9mMmZzL2Rh
dGEuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+IGlu
ZGV4IGQ5NDk0YjVmYzdjMS4uNWVmMTg3NGI1NzJhIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvZGF0
YS5jCj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiBAQCAtNDE4NSw3ICs0MTg1LDcgQEAgc3RhdGlj
IGludCBmMmZzX2lvbWFwX2JlZ2luKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGxvZmZfdCBvZmZzZXQs
IGxvZmZfdCBsZW5ndGgsCj4gICAgICAgICBpZiAoV0FSTl9PTl9PTkNFKG1hcC5tX3BibGsgPT0g
Q09NUFJFU1NfQUREUikpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Cj4gLSAg
ICAgICBpZiAobWFwLm1fcGJsayAhPSBOVUxMX0FERFIpIHsKPiArICAgICAgIGlmIChtYXAubV9m
bGFncyAmIEYyRlNfTUFQX01BUFBFRCkgewo+ICAgICAgICAgICAgICAgICBpb21hcC0+bGVuZ3Ro
ID0gYmxrc190b19ieXRlcyhpbm9kZSwgbWFwLm1fbGVuKTsKPiAgICAgICAgICAgICAgICAgaW9t
YXAtPnR5cGUgPSBJT01BUF9NQVBQRUQ7Cj4gICAgICAgICAgICAgICAgIGlvbWFwLT5mbGFncyB8
PSBJT01BUF9GX01FUkdFRDsKPiAtLQo+IDIuNDAuMQo+CgoKLS0gCkJlc3QgUmVnYXJkcywKICBZ
aSBaaGFuZwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
