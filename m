Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2C8241989
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Aug 2020 12:19:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k5RMv-0005xY-S7; Tue, 11 Aug 2020 10:18:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@redhat.com>) id 1k5RMu-0005xI-J2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 10:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UGIEadAmJFrpPUaSUH2vD4yq03oh2Pcl5fkltSJrHBs=; b=mn91W//+hIMkSNC8xd8RO6KKlV
 ixxq7d7LQOy+Wsb0AkXTpszCX1LsDWPpLn8ozLbb5SlugLqRJtv/LfaRDuWvXUQmlK8fSwMOuir1M
 H9o8t/lQZarlfI6zjU0Qzq+uTAGouFjkrKYxaEeuU2fHJPRhakn9MPRK29FEXSg4oR4g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UGIEadAmJFrpPUaSUH2vD4yq03oh2Pcl5fkltSJrHBs=; b=hk+u0A5au0KicZgJFwLNxJlHN1
 LBS8VyTopHfsjNCFuo5xx7RikrxtBFUhsaKN0P/8z59ereIIUY2ShGS37iXO/a7CUPsmR4TySGMH4
 VWaKgc+bUf5qJalSDluqAV8GhOj8Y1b2CMutqqQX7KQnzxev/TbXKuq76UQCRrJEeL6k=;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1k5RMt-005E05-1k
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 10:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597141121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UGIEadAmJFrpPUaSUH2vD4yq03oh2Pcl5fkltSJrHBs=;
 b=HrtCscKcqP5bt6dFocuJrxis5NqkJWF9/deXCOnpC6PfR3PodFqeLgIaSowUGrkfqpRR1u
 FJvDUxYLSIStnELxrgL9lRyRFQMns4+SKhUsu+NkI8gqzqdeM/vmtzntJiWEa4EY2waCvG
 WkNvWCHc2SqUoCdpDlzBarVaq1FTFMU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-Dj-kj5GpOV2GRLFb2rTF3A-1; Tue, 11 Aug 2020 06:18:39 -0400
X-MC-Unique: Dj-kj5GpOV2GRLFb2rTF3A-1
Received: by mail-pj1-f72.google.com with SMTP id lx6so1985870pjb.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Aug 2020 03:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=dXr0v2qCKUiU33aW80QeAyd5m+K7XDsVEelwTu5R4yM=;
 b=YcWl0WswYBgnsy5dp2vgIG/KACEUm6tzcRmX1GX839dWd/kcaNwEOGipFh2c3pa8De
 0tG6dfli8bI+h6uwYfpZh6T3Fg1jc/HRp6hPwTCKCOEY49N1KHqUERBVlSCX8usvFMWb
 nbAgVL0mRcPDGmITZRq8P3VHe+4Q5doP+o+8Gb4nIsWxqlM0xqNx+4Tq8lbjWlpIR27N
 RUN/NS6YssE4Ve9dbFb4jpVHvJm3n1wdonF7mQ3YmCYF5qq9lstwaTwiSUjYO7SV3Yfy
 tMevkSRcTl+mvquU4vEQiw80TMaIZl59Rpmr3+mZlg1JyJVuvTZON1uXtgyDiR9/yoHL
 s/Aw==
X-Gm-Message-State: AOAM532ukXHQPz9R8f37D2OKrUMUpaVjBHXxaKCQGgWQ/z5sEt78A8xm
 S7cl/LeOZDCGiQPPq04Y2etGYE37GHVgTFdWHco355b9wQ/oy+tg40UoRzhNrPLan9jB0xjv2b6
 wX3LDgrYnsLIeOlxJfpeARuMvV19lU4b2B+znJw==
X-Received: by 2002:a17:90b:1092:: with SMTP id
 gj18mr352169pjb.10.1597141118811; 
 Tue, 11 Aug 2020 03:18:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxK6UND4AXpX87GBFtSia3sjBshFyIl2h6dcdG3mZugkorVx/HwVZyuaovl/iCAB8U7+1XTWw==
X-Received: by 2002:a17:90b:1092:: with SMTP id
 gj18mr352152pjb.10.1597141118495; 
 Tue, 11 Aug 2020 03:18:38 -0700 (PDT)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id k125sm22603134pga.48.2020.08.11.03.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 03:18:37 -0700 (PDT)
Date: Tue, 11 Aug 2020 18:18:27 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200811101827.GA7870@xiangao.remote.csb>
References: <20200811033753.783276-1-daeho43@gmail.com>
 <20200811071552.GA8365@xiangao.remote.csb>
 <3059d7b0-cf50-4315-e5a9-8d9c00965a7c@huawei.com>
 <CACOAw_yic7GF3E1zEvZ=Gea3XW4fMYdg-cNuu4wfg+uTKMcJqA@mail.gmail.com>
 <CACOAw_wi3C0iyTVYc3075d4K27NT7BGMGzsKFDDozf=98vWMcA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACOAw_wi3C0iyTVYc3075d4K27NT7BGMGzsKFDDozf=98vWMcA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hsiangkao@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.205.24.124 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k5RMt-005E05-1k
Subject: Re: [f2fs-dev] [PATCH] f2fs: change virtual mapping way for
 compression pages
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
Cc: kernel-team@android.com, Daeho Jeong <daehojeong@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBBdWcgMTEsIDIwMjAgYXQgMDY6MzM6MjZQTSArMDkwMCwgRGFlaG8gSmVvbmcgd3Jv
dGU6Cj4gUGx1cywgd2hlbiB3ZSB1c2Ugdm1hcCgpLCB2bWFwKCkgbm9ybWFsbHkgZXhlY3V0ZXMg
aW4gYSBzaG9ydCB0aW1lCj4gbGlrZSB2bV9tYXBfcmFtKCkuCj4gQnV0LCBzb21ldGltZXMsIGl0
IGhhcyBhIHZlcnkgbG9uZyBkZWxheS4KPiAKPiAyMDIww6vigKbigJ4gOMOs4oC64oCdIDExw6zv
v73CvCAow63ihKLigJ0pIMOsy5zCpMOt4oC64oCeIDY6MjgsIERhZWhvIEplb25nIDxkYWVobzQz
QGdtYWlsLmNvbT7Dq+KAucucw6zvv73CtCDDrMW+4oCYw6zigJ7CsToKPiA+Cj4gPiBBY3R1YWxs
eSwgYXMgeW91IGNhbiBzZWUsIEkgdXNlIHRoZSB3aG9sZSB6ZXJvIGRhdGEgYmxvY2tzIGluIHRo
ZSB0ZXN0IGZpbGUuCj4gPiBJdCBjYW4gbWF4aW1pemUgdGhlIGVmZmVjdCBvZiBjaGFuZ2luZyB2
aXJ0dWFsIG1hcHBpbmcuCj4gPiBXaGVuIEkgdXNlIG5vcm1hbCBmaWxlcyB3aGljaCBjYW4gYmUg
Y29tcHJlc3NlZCBhYm91dCA3MCUgZnJvbSB0aGUKPiA+IG9yaWdpbmFsIGZpbGUsCj4gPiBUaGUg
dm1fbWFwX3JhbSgpIHZlcnNpb24gaXMgYWJvdXQgMnggZmFzdGVyIHRoYW4gdm1hcCgpIHZlcnNp
b24uCgpXaGF0IGYyZnMgZG9lcyBpcyBtdWNoIHNpbWlsYXIgdG8gYnRyZnMgY29tcHJlc3Npb24u
IEV2ZW4gaWYgdGhlc2UKYmxvY2tzIGFyZSBhbGwgemVyb2VkLiBJbiBwcmluY2lwbGUsIHRoZSBt
YXhpbXVtIGNvbXByZXNzaW9uIHJhdGlvCmlzIGRldGVybWluZWQgKGNsdXN0ZXIgc2l6ZWQgYmxv
Y2tzIGludG8gb25lIGNvbXByZXNzZWQgYmxvY2ssIGUuZwoxNmsgY2x1c3RlciBpbnRvIG9uZSBj
b21wcmVzc2VkIGJsb2NrKS4KClNvIGl0J2QgYmUgYmV0dGVyIHRvIGRlc2NyaWJlIHlvdXIgY29u
ZmlndXJlZCBjbHVzdGVyIHNpemUgKDE2ayBvcgoxMjhrKSBhbmQgeW91ciBoYXJkd2FyZSBpbmZv
cm1hdGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgYXMgd2VsbC4KCkFjdHVhbGx5LCBJIGFsc28g
dHJpZWQgd2l0aCB0aGlzIHBhdGNoIGFzIHdlbGwgb24gbXkgeDg2IGxhcHRvcCBqdXN0Cm5vdyB3
aXRoIEZJTyAoSSBkaWRuJ3QgdXNlIHplcm9lZCBibG9jayB0aG91Z2gpLCBhbmQgSSBkaWRuJ3Qg
bm90aWNlCm11Y2ggZGlmZmVyZW5jZSB3aXRoIHR1cmJvIGJvb3N0IG9mZiBhbmQgbWF4ZnJlcS4K
CkknbSBub3QgYXJndWluZyB0aGlzIGNvbW1pdCwganVzdCBhIG5vdGUgYWJvdXQgdGhpcyBjb21t
aXQgbWVzc2FnZS4KPiA+ID4gPj4gMTA0ODU3NjAwMCBieXRlcyAoMC45IEcpIGNvcGllZCwgOS4x
NDYyMTcgcywgMTA5IE0vcwo+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVk
LCA5Ljk5NzU0MiBzLCAxMDAgTS9zCj4gPiA+ID4+IDEwNDg1NzYwMDAgYnl0ZXMgKDAuOSBHKSBj
b3BpZWQsIDEwLjEwOTcyNyBzLCA5OSBNL3MKCklNSE8sIHRoZSBhYm92ZSBudW1iZXIgaXMgbXVj
aCBsaWtlIGRlY29tcHJlc3NpbmcgaW4gdGhlIGFybTY0IGxpdHRsZSBjb3Jlcy4KClRoYW5rcywK
R2FvIFhpYW5nCgoKPiA+Cj4gPiAyMDIww6vigKbigJ4gOMOs4oC64oCdIDExw6zvv73CvCAow63i
hKLigJ0pIMOsy5zCpMOt4oC64oCeIDQ6NTUsIENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT7D
q+KAucucw6zvv73CtCDDrMW+4oCYw6zigJ7CsToKPiA+ID4KPiA+ID4gT24gMjAyMC84LzExIDE1
OjE1LCBHYW8gWGlhbmcgd3JvdGU6Cj4gPiA+ID4gT24gVHVlLCBBdWcgMTEsIDIwMjAgYXQgMTI6
Mzc6NTNQTSArMDkwMCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiA+ID4+IEZyb206IERhZWhvIEpl
b25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiA+ID4+Cj4gPiA+ID4+IEJ5IHByb2ZpbGlu
ZyBmMmZzIGNvbXByZXNzaW9uIHdvcmtzLCBJJ3ZlIGZvdW5kIHZtYXAoKSBjYWxsaW5ncyBhcmUK
PiA+ID4gPj4gYm90dGxlbmVja3Mgb2YgZjJmcyBkZWNvbXByZXNzaW9uIHBhdGguIENoYW5naW5n
IHRoZXNlIHdpdGgKPiA+ID4gPj4gdm1fbWFwX3JhbSgpLCB3ZSBjYW4gZW5oYW5jZSBmMmZzIGRl
Y29tcHJlc3Npb24gc3BlZWQgcHJldHR5IG11Y2guCj4gPiA+ID4+Cj4gPiA+ID4+IFtWZXJpZmlj
YXRpb25dCj4gPiA+ID4+IGRkIGlmPS9kZXYvemVybyBvZj1kdW1teSBicz0xbSBjb3VudD0xMDAw
Cj4gPiA+ID4+IGVjaG8gMyA+IC9wcm9jL3N5cy92bS9kcm9wX2NhY2hlcwo+ID4gPiA+PiBkZCBp
Zj1kdW1teSBvZj0vZGV2L3plcm8gYnM9NTEyawo+ID4gPiA+Pgo+ID4gPiA+PiAtIHcvbyBjb21w
cmVzc2lvbiAtCj4gPiA+ID4+IDEwNDg1NzYwMDAgYnl0ZXMgKDAuOSBHKSBjb3BpZWQsIDEuOTk5
Mzg0IHMsIDUwMCBNL3MKPiA+ID4gPj4gMTA0ODU3NjAwMCBieXRlcyAoMC45IEcpIGNvcGllZCwg
Mi4wMzU5ODggcywgNDkxIE0vcwo+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29w
aWVkLCAyLjAzOTQ1NyBzLCA0OTAgTS9zCj4gPiA+ID4+Cj4gPiA+ID4+IC0gYmVmb3JlIHBhdGNo
IC0KPiA+ID4gPj4gMTA0ODU3NjAwMCBieXRlcyAoMC45IEcpIGNvcGllZCwgOS4xNDYyMTcgcywg
MTA5IE0vcwo+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCA5Ljk5NzU0
MiBzLCAxMDAgTS9zCj4gPiA+ID4+IDEwNDg1NzYwMDAgYnl0ZXMgKDAuOSBHKSBjb3BpZWQsIDEw
LjEwOTcyNyBzLCA5OSBNL3MKPiA+ID4gPj4KPiA+ID4gPj4gLSBhZnRlciBwYXRjaCAtCj4gPiA+
ID4+IDEwNDg1NzYwMDAgYnl0ZXMgKDAuOSBHKSBjb3BpZWQsIDIuMjUzNDQxIHMsIDQ0NCBNL3MK
PiA+ID4gPj4gMTA0ODU3NjAwMCBieXRlcyAoMC45IEcpIGNvcGllZCwgMi43Mzk3NjQgcywgMzY1
IE0vcwo+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCAyLjE4NTY0OSBz
LCA0NTggTS9zCj4gPiA+ID4KPiA+ID4gPiBJbmRlZWQsIHZtYXAoKSBhcHByb2FjaCBoYXMgc29t
ZSBpbXBhY3Qgb24gdGhlIHdob2xlCj4gPiA+ID4gd29ya2Zsb3cuIEJ1dCBJIGRvbid0IHRoaW5r
IHRoZSBnYXAgaXMgc3VjaCBzaWduaWZpY2FudCwKPiA+ID4gPiBtYXliZSBpdCByZWxhdGVzIHRv
IHVubG9ja2VkIGNwdWZyZXEgKGFuZCBiaWcgbGl0dGxlCj4gPiA+ID4gY29yZSBkaWZmZXJlbmNl
IGlmIGl0J3Mgb24gc29tZSBhcm02NCBib2FyZCkuCj4gPiA+Cj4gPiA+IEFncmVlZCwKPiA+ID4K
PiA+ID4gSSBndWVzcyB0aGVyZSBzaG91bGQgYmUgb3RoZXIgcmVhc29uIGNhdXNpbmcgdGhlIGxh
cmdlIHBlcmZvcm1hbmNlCj4gPiA+IGdhcCwgc2NoZWR1bGluZywgZnJlcXVlbmN5LCBvciBzb21l
dGhpbmcgZWxzZS4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiA+IExpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiA+ID4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKPiA+ID4gPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4gPiA+ID4gLgo+ID4gPiA+Cj4gCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
