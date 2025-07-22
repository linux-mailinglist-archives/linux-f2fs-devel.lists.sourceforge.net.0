Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7E1B0D0AE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jul 2025 05:55:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8n6ihk4qeGknNlCS1UsxT+I46QDRupPdnjd7Jq5z2w=; b=QZTWULoG6WwDl8dMajwMK1J0Ci
	1WrzujSdoC8iLxUTD5mXHTQ/tKncFii7Mv98pJrCXAUCCJw3aDzzVDqz7z1x8gStJxh/IdnxnzeuE
	d6aFnx+l57h0rTpaplbyGSEpjWlR+AW2H3TiM0mjzM9T4Y+6Pxn8mCNXwoYn2HJZBb0k=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ue45P-00017s-15;
	Tue, 22 Jul 2025 03:54:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <21cnbao@gmail.com>) id 1ue45N-00017l-In
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 03:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sAAlykKu642VPrQqfIgQ/sSqAoZceoQZhIURS8zROzA=; b=SQK6R/yEX20xYD67Ll1aK9JWw6
 lXmTqxlxhABbM52gQaB0uF3cpREyopZJ1//JlHRSiNVsoxBr1DBEMbheTQhprYrCmmFFy1d8w2uvx
 3doBvGJvAmPQWAqlSf6hj7jhnVAIMzgrL2H+16Zhx/tlt/7w2VQeUhKXf4JilgEP0WFg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sAAlykKu642VPrQqfIgQ/sSqAoZceoQZhIURS8zROzA=; b=hfmXm/GKCBi278X5NlLQykxC5N
 T9USsPjbO7GW8l3VP2iPyymO1IainInpshjn147cTQdb8x3ebcPvE7DO2cShZrWA5vVDXnTTGVhd1
 zKCxycjSC0LWFVerijojUGTtxgEQlvr9RMhs28azdF5aDiDoEHrd60mefQgXBIyjxIVE=;
Received: from mail-vk1-f180.google.com ([209.85.221.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ue45N-0006MT-6C for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 03:54:37 +0000
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-5315ebfda19so1308448e0c.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Jul 2025 20:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753156466; x=1753761266; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sAAlykKu642VPrQqfIgQ/sSqAoZceoQZhIURS8zROzA=;
 b=RzOOAHIYE6qMZiirqzBxwsvP84KY7+cvNSSDEVzcWkduYojxz563xpQhhrdoMKs4nw
 f6NPHTwnfXlJgLz6xEcC0eYM/i+/JxV2jirJreNUaYhTYSvjMOU/duhRd9TX5FIhuerk
 IFPGZBe36+PQmLa+cl9dU0xNgfLa8Oynway9z8y7MGc6OcKbGAgecEH0e6xB1xIm6sqq
 EpsYQPJPyFIUjYz3w4hIjuKR6FmxRtxXHf7/JyvHghsWGxqnN10q+31zZ95/7CqAeTLB
 +aj6HzMKcbPXgXzpKG5Q7qjc7944rrQomTR/Iz3wJ8Q1/TAN8a+DpV1eXe+2EzXJurJs
 Tb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753156466; x=1753761266;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sAAlykKu642VPrQqfIgQ/sSqAoZceoQZhIURS8zROzA=;
 b=hbEdcNvsGHQNScrLPnnIM8UcUm0yVJimtAeKxBwcB+yJB47xu4Mt9HqZzWHgiRCboa
 N80GMbvG2WdfoOoHla0zW2DYujaVAc3BIkS8S1Twhwtt99OKYJpX7m8OrIJ3y3z1NC4B
 Dg9bXONsPczjeCMSNGQzgHqVoArHOW8EEwdA/g0BIh9mLgwAR8zj/0EXNnGYrkFYOQsl
 mLoK4SwNELI2yyqAtX/nLOJ+eNy0yWAUnr2AR5k8wIBNGHk/c2JaX9Ni6d00jm4r9pOS
 5FTAxMHh4qA0YBUauhIsasJ/h5LAldPVCNPYBIiFf8i1gl0IwLniBRT2HQC+r0b4t2bF
 TUMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxvl6GI27+tSg71vbiZkvkhQW7BkbIgju9sqf1xUk0ANEXAYb9IK+G5LVli3WuRYQGTQ9jdYEj55IK1JdxcdsI@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyP4f+Vn+xs52u6igEdohZZUxgFpy9WMwR+wt1doiDHLWtCjkhh
 idfB2sPOVFmS/PFThseFHJkiL2GA8mngQTdnQ5pHRJiJ3IeYyaPM6sgzvQ0Cm4NMWsEoipkZKne
 ztIQfS7K0OOfkR87egcFfbtvgV6ILkwtyyP8qJIU=
X-Gm-Gg: ASbGncv82cEztt+cegMhZamdNwLBXGpyT5jf77IFqhN/bjsfFW62e2cf3vFUZnxwppL
 Y3YAYspwLV9in+QQN1RCndH76fE87KBqbQbjUaGGiatzap3dcjzInIqkDgemFK3bielhakVJPyY
 LGYHoqb5Z6WHD//YCH1eqqvTRyhT8LYnDKlfsHJ2NuDBpLAIsyoPZ4TDRO5KV7/o9Hm3yGTR800
 6n5orc=
X-Google-Smtp-Source: AGHT+IFdEM3sDnKSU7djtnY2X77gIkWr33PBhDuXfdQIDGEOAUgRW6b8nyrGT5SpWkQFjiRSNtgM+8Lmi+axf63N/6M=
X-Received: by 2002:a05:6122:4d0f:b0:531:236f:1295 with SMTP id
 71dfb90a1353d-5373fbda52dmr10043238e0c.5.1753156466033; Mon, 21 Jul 2025
 20:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
 <b61c4b7f-4bb1-4551-91ba-a0e0ffd19e75@linux.alibaba.com>
 <CAGsJ_4xJjwsvMpeBV-QZFoSznqhiNSFtJu9k6da_T-T-a6VwNw@mail.gmail.com>
 <7ea73f49-df4b-4f88-8b23-c917b4a9bd8a@linux.alibaba.com>
 <z2ule3ilnnpoevo5mvt3intvjtuyud7vg3pbfauon47fhr4owa@giaehpbie4a5>
 <85946346-8bfd-4164-a49d-594b4a158588@gmx.com>
In-Reply-To: <85946346-8bfd-4164-a49d-594b4a158588@gmx.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 22 Jul 2025 11:54:14 +0800
X-Gm-Features: Ac12FXykbYYT14P53wpCeHJw2yoMEcQU-j3E43IYKsTdPACdf43QFDrlblVigVM
Message-ID: <CAGsJ_4ySQFzSbXZzecH9oy53KFpVsoaqXThPiJxfYUJF3_Y+Hg@mail.gmail.com>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Jul 21, 2025 at 7:37 PM Qu Wenruo wrote: > > > > 在
    2025/7/21 19:55, Jan Kara 写道: > > On Mon 21-07-25 11:14:02, Gao Xiang
    wrote: > >> Hi Barry, > >> > >> On 2025/7/21 09:02, Barry Song [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [21cnbao(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.180 listed in wl.mailspike.net]
X-Headers-End: 1ue45N-0006MT-6C
Subject: Re: [f2fs-dev] Compressed files & the page cache
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
Cc: Jan Kara <jack@suse.cz>, Paulo Alcantara <pc@manguebit.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Matthew Wilcox <willy@infradead.org>, Gao Xiang <hsiangkao@linux.alibaba.com>,
 Gao Xiang <xiang@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Phillip Lougher <phillip@squashfs.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Howells <dhowells@redhat.com>,
 Nicolas Pitre <nico@fluxnic.net>, David Woodhouse <dwmw2@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 Hailong Liu <hailong.liu@oppo.com>, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBKdWwgMjEsIDIwMjUgYXQgNzozN+KAr1BNIFF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRy
ZnNAZ214LmNvbT4gd3JvdGU6Cj4KPgo+Cj4g5ZyoIDIwMjUvNy8yMSAxOTo1NSwgSmFuIEthcmEg
5YaZ6YGTOgo+ID4gT24gTW9uIDIxLTA3LTI1IDExOjE0OjAyLCBHYW8gWGlhbmcgd3JvdGU6Cj4g
Pj4gSGkgQmFycnksCj4gPj4KPiA+PiBPbiAyMDI1LzcvMjEgMDk6MDIsIEJhcnJ5IFNvbmcgd3Jv
dGU6Cj4gPj4+IE9uIFdlZCwgSnVsIDE2LCAyMDI1IGF0IDg6MjjigK9BTSBHYW8gWGlhbmcgPGhz
aWFuZ2thb0BsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4gWy4uLl0KPiA+Pj4gR2l2ZW4gdGhl
IGRpZmZpY3VsdHkgb2YgYWxsb2NhdGluZyBsYXJnZSBmb2xpb3MsIGl0J3MgYWx3YXlzIGEgZ29v
ZAo+ID4+PiBpZGVhIHRvIGhhdmUgb3JkZXItMCBhcyBhIGZhbGxiYWNrLiBXaGlsZSBJIGFncmVl
IHdpdGggeW91ciBwb2ludCwKPiA+Pj4gSSBoYXZlIGEgc2xpZ2h0bHkgZGlmZmVyZW50IHBlcnNw
ZWN0aXZlIOKAlCBlbmFibGluZyBsYXJnZSBmb2xpb3MgZm9yCj4gPj4+IHRob3NlIGRldmljZXMg
bWlnaHQgYmUgYmVuZWZpY2lhbCwgYnV0IHRoZSBtYXhpbXVtIG9yZGVyIHNob3VsZAo+ID4+PiBy
ZW1haW4gc21hbGwuIEknbSByZWZlcnJpbmcgdG8gInNtYWxsIiBsYXJnZSBmb2xpb3MuCj4gPj4K
PiA+PiBZZWFoLCBhZ3JlZWQuIEhhdmluZyBhIHdheSB0byBsaW1pdCB0aGUgbWF4aW11bSBvcmRl
ciBmb3IgdGhvc2Ugc21hbGwKPiA+PiBkZXZpY2VzIChyYXRoZXIgdGhhbiBkaXNhYmxpbmcgaXQg
Y29tcGxldGVseSkgd291bGQgYmUgaGVscGZ1bC4gIEF0Cj4gPj4gbGVhc3QgInNtYWxsIiBsYXJn
ZSBmb2xpb3MgY291bGQgc3RpbGwgcHJvdmlkZSBiZW5lZml0cyB3aGVuIG1lbW9yeQo+ID4+IHBy
ZXNzdXJlIGlzIGxpZ2h0Lgo+ID4KPiA+IFdlbGwsIGluIHRoZSBwYWdlIGNhY2hlIHlvdSBjYW4g
dHVuZSBub3Qgb25seSB0aGUgbWluaW11bSBidXQgYWxzbyB0aGUKPiA+IG1heGltdW0gb3JkZXIg
b2YgYSBmb2xpbyBiZWluZyBhbGxvY2F0ZWQgZm9yIGVhY2ggaW5vZGUuIEJ0cmZzIGFuZCBleHQ0
Cj4gPiBhbHJlYWR5IHVzZSB0aGlzIGZ1bmN0aW9uYWxpdHkuIFNvIGluIHByaW5jaXBsZSB0aGUg
ZnVuY3Rpb25hbGl0eSBpcyB0aGVyZSwKPiA+IGl0IGlzICJqdXN0IiBhIHF1ZXN0aW9uIG9mIHBy
b3BlciB1c2VyIGludGVyZmFjZXMgb3IgYXV0b21hdGljIGxvZ2ljIHRvCj4gPiB0dW5lIHRoaXMg
bGltaXQuCj4gPgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBIb256YQo+Cj4gQW5kIGVuYWJsaW5nIGxhcmdlIGZvbGlvcyBk
b2Vzbid0IG1lYW4gYWxsIGZzIG9wZXJhdGlvbnMgd2lsbCBncmFiIGFuCj4gdW5uZWNlc3Nhcmls
eSBsYXJnZSBmb2xpby4KPgo+IEZvciBidWZmZXJlZCB3cml0ZSwgYWxsIHRob3NlIGZpbGVzeXN0
ZW0gd2lsbCBvbmx5IHRyeSB0byBnZXQgZm9saW9zIGFzCj4gbGFyZ2UgYXMgbmVjZXNzYXJ5LCBu
b3Qgb3Zlcmx5IGxhcmdlLgo+Cj4gVGhpcyBtZWFucyBpZiB0aGUgdXNlciBzcGFjZSBwcm9ncmFt
IGlzIGFsd2F5cyBkb2luZyBidWZmZXJlZCBJTyBpbiBhCj4gcG93ZXItb2YtdHdvIHVuaXQgKGFu
ZCBhbGlnbmVkIG9mZnNldCBvZiBjb3Vyc2UpLCB0aGUgZm9saW8gc2l6ZSB3aWxsCj4gbWF0Y2gg
dGhlIGJ1ZmZlciBzaXplIHBlcmZlY3RseSAoaWYgd2UgaGF2ZSBlbm91Z2ggbWVtb3J5KS4KPgo+
IFNvIGZvciBwcm9wZXJseSBhbGlnbmVkIGJ1ZmZlcmVkIHdyaXRlcywgbGFyZ2UgZm9saW9zIHdv
bid0IHJlYWxseSBjYXVzZQo+ICAgdW5uZWNlc3NhcmlseSBsYXJnZSBmb2xpb3MsIG1lYW53aGls
ZSBicmluZ3MgYWxsIHRoZSBiZW5lZml0cy4KCkkgZG9uJ3QgdGhpbmsgdGhpcyBjYXB0dXJlcyB0
aGUgZnVsbCBwaWN0dXJlLiBGb3IgZXhhbXBsZSwgaW4gbWVtb3J5CnJlY2xhbWF0aW9uLCBpZiBh
bnkgc2luZ2xlIHN1YnBhZ2UgaXMgaG90LCB0aGUgZW50aXJlIGxhcmdlIGZvbGlvIGlzCnRyZWF0
ZWQgYXMgaG90IGFuZCBjYW5ub3QgYmUgcmVjbGFpbWVkLiBTbyBJ4oCZbSBub3QgY29udmluY2Vk
IHRoYXQKImZpbGVzeXN0ZW1zIHdpbGwgb25seSB0cnkgdG8gZ2V0IGZvbGlvcyBhcyBsYXJnZSBh
cyBuZWNlc3NhcnkiIGlzIHRoZQpyaWdodCBwb2xpY3kuCgpMYXJnZSBmb2xpb3MgYXJlIGEgZ29v
ZCBpZGVhLCBidXQgdGhlIGxhY2sgb2YgY29udHJvbCBvdmVyIHRoZWlyIG1heGltdW0Kc2l6ZSBs
aW1pdHMgdGhlaXIgcHJhY3RpY2FsIGFwcGxpY2FiaWxpdHkuIFdoZW4gYW4gZW1iZWRkZWQgZGV2
aWNlIGVuYWJsZXMKbGFyZ2UgZm9saW9zIGFuZCBvbmx5IG9ic2VydmVzIHBlcmZvcm1hbmNlIHJl
Z3Jlc3Npb25zLCB0aGUgaW1tZWRpYXRlCnJlYWN0aW9uIGlzIG9mdGVuIHRvIGRpc2FibGUgdGhl
IGZlYXR1cmUgZW50aXJlbHkuIFRoaXMsIGluIHR1cm4sIGhhcm1zIHRoZQphZG9wdGlvbiBhbmQg
ZGV2ZWxvcG1lbnQgb2YgbGFyZ2UgZm9saW9zLgoKPgo+IEFsdGhvdWdoIEknbSBub3QgZmFtaWxp
YXIgZW5vdWdoIHdpdGggZmlsZW1hcCB0byBjb21tZW50IG9uIGZvbGlvIHJlYWQKPiBhbmQgcmVh
ZGFoZWFkLi4uCj4KPiBUaGFua3MsCj4gUXUKCkJlc3QgUmVnYXJkcwpCYXJyeQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
