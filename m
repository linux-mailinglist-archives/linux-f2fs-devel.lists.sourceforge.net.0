Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C21B01FF230
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 14:46:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jltw2-0003Al-C5; Thu, 18 Jun 2020 12:46:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <agruenba@redhat.com>) id 1jltw1-0003Ae-Dn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 12:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jx2chy+DXXXPslp3yfr/ExQZEB8p36U9cp+dBBsmha4=; b=NHdG3J3mavPnWtEn2LBeW5BxA7
 EHWiQAzf25C+JL1wl/jVugZTNmcG1rwBSpcExZmua7s1r9yAFGSvbGTq04UnXlAzWKz5TSSGxMZBR
 ZLpXxuxv/StyMVzooh4CEWTvCcxAqjoj96pku64kuHvw7gWB+2CQNZuJkBpV0T5fnHIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jx2chy+DXXXPslp3yfr/ExQZEB8p36U9cp+dBBsmha4=; b=bWiG36+1dbbQQbZmmP6MZEmem2
 WAXId2AWqTMF/XEukID1gzwDfjwwk5hWXC9UE/1Ob3J1cFL83SVXdTRIvYmhBUlFt5wiTzido0vk2
 NVdkkXd6iBGM6us0p0XQ5lgW5JVQS6n/ajcfrDchj1+Lh6FxIYmVJpWk0VrLZnI/JMrM=;
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1jltvz-00Add6-GA
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 12:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592484377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jx2chy+DXXXPslp3yfr/ExQZEB8p36U9cp+dBBsmha4=;
 b=h7Ftdw1WTmPytI2eIit/SWPmSzK6eAJPPK5WnFzNeImRDPOgmU4UbF07fZMqn28Lgn/Isn
 f1tAGW+XUov5PUGD9D5FdA5ppKS3t8F5l4neaqCFjA5VCGCdQbWQcCOi4OdZYxKX9WIuBg
 7IQc4CeH4+El7k8T/bQC/sUyYwm2eN0=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-589tHp0CPqSGfP1od43UJQ-1; Thu, 18 Jun 2020 08:46:15 -0400
X-MC-Unique: 589tHp0CPqSGfP1od43UJQ-1
Received: by mail-oi1-f197.google.com with SMTP id r13so2639624oic.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Jun 2020 05:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Jx2chy+DXXXPslp3yfr/ExQZEB8p36U9cp+dBBsmha4=;
 b=Gwe+pnYrTJMyskeo6YW0mVGFBRyRge0maOTJhbQyxk5ZXxXYpWjAlngVI1zh41gmLE
 8wDX+m44n6ylsq0qSf++FRYsjkOKCddY8PaVvI1+4za/Q9S1PkspRaE9ytNcDwQuo7hj
 CRp8Uo1+FMmN841XURoQyT+8QAX9F+o2aZ6hlLGmG0peQFN7DSw9lW4dWzEqhhlhRUsq
 icjaUhFl8dgWNLl9NRM9v+pq86yV+0hamgwxYL4hFwxAjIkBnX4LIC7yNvZXnaOzPwK0
 6sL6L57jv4Tw80kKZ64522NstQUH4DoT+f0SJYpNzcFoRPT5E5E46S3cGPsLCATHGtIb
 dmZg==
X-Gm-Message-State: AOAM532HgYTUpQTGVma7RdQWpPxyy0AXJ1m278pocNOyP4F0kwUJ4Lk1
 9oUGYeYcu7RTLmrNo5azuuOEE6kKOBd+EBujnVQm8ILiZ+w27wDxn1blF9lUHMXq7Lt0BlTvK4r
 awqVrsYKG2iwXPcWqbgxY7Z+mA2LToXEzs99KrpiTFT9HQcmv/PpjUg==
X-Received: by 2002:a05:6830:10c8:: with SMTP id
 z8mr3014454oto.95.1592484374639; 
 Thu, 18 Jun 2020 05:46:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOwYhxZwvrmXCEEJ4lNIcITT1uhrr+sNqXkjoRh5QLgqAWYsSVfGAkiWuBNYfSRh2ekFx49DQ8VN9O2a7lFfU=
X-Received: by 2002:a05:6830:10c8:: with SMTP id
 z8mr3014426oto.95.1592484374383; 
 Thu, 18 Jun 2020 05:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200414150233.24495-1-willy@infradead.org>
 <20200414150233.24495-17-willy@infradead.org>
 <CAHc6FU4m1M7Tv4scX0UxSiVBqkL=Vcw_z-R7SufL8k7Bw=qPOw@mail.gmail.com>
 <20200617003216.GC8681@bombadil.infradead.org>
 <CAHpGcMK6Yu0p-FO8CciiySqh+qcWLG-t3hEaUg-rqJnS=2uhqg@mail.gmail.com>
 <20200617022157.GF8681@bombadil.infradead.org>
In-Reply-To: <20200617022157.GF8681@bombadil.infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 18 Jun 2020 14:46:03 +0200
Message-ID: <CAHc6FU7NLRHKRJJ6c2kQT0ig8ed1n+3qR-YcSCWzXOeJCUsLbA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [205.139.110.61 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [205.139.110.61 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jltvz-00Add6-GA
Subject: Re: [f2fs-dev] [Cluster-devel] [PATCH v11 16/25] fs: Convert
 mpage_readpages to mpage_readahead
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
Cc: cluster-devel <cluster-devel@redhat.com>,
 linux-ext4 <linux-ext4@vger.kernel.org>,
 Steven Whitehouse <swhiteho@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, John Hubbard <jhubbard@nvidia.com>,
 =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Junxiao Bi <junxiao.bi@oracle.com>,
 linux-xfs <linux-xfs@vger.kernel.org>,
 William Kucharski <william.kucharski@oracle.com>,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-erofs@lists.ozlabs.org,
 Linux-MM <linux-mm@kvack.org>, ocfs2-devel@oss.oracle.com,
 Bob Peterson <rpeterso@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKdW4gMTcsIDIwMjAgYXQgNDoyMiBBTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5m
cmFkZWFkLm9yZz4gd3JvdGU6Cj4gT24gV2VkLCBKdW4gMTcsIDIwMjAgYXQgMDI6NTc6MTRBTSAr
MDIwMCwgQW5kcmVhcyBHcsO8bmJhY2hlciB3cm90ZToKPiA+IEFtIE1pLiwgMTcuIEp1bmkgMjAy
MCB1bSAwMjozMyBVaHIgc2NocmllYiBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9y
Zz46Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgSnVuIDE3LCAyMDIwIGF0IDEyOjM2OjEzQU0gKzAyMDAs
IEFuZHJlYXMgR3J1ZW5iYWNoZXIgd3JvdGU6Cj4gPiA+ID4gQW0gTWkuLCAxNS4gQXByLiAyMDIw
IHVtIDIzOjM5IFVociBzY2hyaWViIE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3Jn
PjoKPiA+ID4gPiA+IEZyb206ICJNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSIgPHdpbGx5QGluZnJh
ZGVhZC5vcmc+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSW1wbGVtZW50IHRoZSBuZXcgcmVhZGFoZWFk
IGFvcCBhbmQgY29udmVydCBhbGwgY2FsbGVycyAoYmxvY2tfZGV2LAo+ID4gPiA+ID4gZXhmYXQs
IGV4dDIsIGZhdCwgZ2ZzMiwgaHBmcywgaXNvZnMsIGpmcywgbmlsZnMyLCBvY2ZzMiwgb21mcywg
cW54NiwKPiA+ID4gPiA+IHJlaXNlcmZzICYgdWRmKS4gIFRoZSBjYWxsZXJzIGFyZSBhbGwgdHJp
dmlhbCBleGNlcHQgZm9yIEdGUzIgJiBPQ0ZTMi4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgcGF0Y2gg
bGVhZHMgdG8gYW4gQUJCQSBkZWFkbG9jayBpbiB4ZnN0ZXN0IGdlbmVyaWMvMDk1IG9uIGdmczIu
Cj4gPiA+ID4KPiA+ID4gPiBPdXIgbG9jayBoaWVyYXJjaHkgaXMgc3VjaCB0aGF0IHRoZSBpbm9k
ZSBjbHVzdGVyIGxvY2sgKCJpbm9kZSBnbG9jayIpCj4gPiA+ID4gZm9yIGFuIGlub2RlIG5lZWRz
IHRvIGJlIHRha2VuIGJlZm9yZSBhbnkgcGFnZSBsb2NrcyBpbiB0aGF0IGlub2RlJ3MKPiA+ID4g
PiBhZGRyZXNzIHNwYWNlLgo+ID4gPgo+ID4gPiBIb3cgZG9lcyB0aGF0IHdvcmsgZm9yIC4uLgo+
ID4gPgo+ID4gPiB3cml0ZXBhZ2U6ICAgICAgICAgICAgICB5ZXMsIHVubG9ja3MgKHNlZSBiZWxv
dykKPiA+ID4gcmVhZHBhZ2U6ICAgICAgICAgICAgICAgeWVzLCB1bmxvY2tzCj4gPiA+IGludmFs
aWRhdGVwYWdlOiAgICAgICAgIHllcwo+ID4gPiByZWxlYXNlcGFnZTogICAgICAgICAgICB5ZXMK
PiA+ID4gZnJlZXBhZ2U6ICAgICAgICAgICAgICAgeWVzCj4gPiA+IGlzb2xhdGVfcGFnZTogICAg
ICAgICAgIHllcwo+ID4gPiBtaWdyYXRlcGFnZTogICAgICAgICAgICB5ZXMgKGJvdGgpCj4gPiA+
IHB1dGJhY2tfcGFnZTogICAgICAgICAgIHllcwo+ID4gPiBsYXVuZGVyX3BhZ2U6ICAgICAgICAg
ICB5ZXMKPiA+ID4gaXNfcGFydGlhbGx5X3VwdG9kYXRlOiAgeWVzCj4gPiA+IGVycm9yX3JlbW92
ZV9wYWdlOiAgICAgIHllcwo+ID4gPgo+ID4gPiBJcyB0aGVyZSBhIHJlYXNvbiB0aGF0IHlvdSBk
b24ndCB0YWtlIHRoZSBnbG9jayBpbiB0aGUgaGlnaGVyIGxldmVsCj4gPiA+IG9wcyB3aGljaCBh
cmUgY2FsbGVkIGJlZm9yZSByZWFkaGVhZCBnZXRzIGNhbGxlZD8gIEknbSBsb29raW5nIGF0IFhG
UywKPiA+ID4gYW5kIGl0IHRha2VzIHRoZSB4ZnNfaWxvY2sgU0hBUkVEIGluIHhmc19maWxlX2J1
ZmZlcmVkX2Fpb19yZWFkKCkKPiA+ID4gKGNhbGxlZCBmcm9tIHhmc19maWxlX3JlYWRfaXRlciku
Cj4gPgo+ID4gUmlnaHQsIHRoZSBhcHByb2FjaCBmcm9tIHRoZSBmb2xsb3dpbmcgdGhyZWFkIG1p
Z2h0IGZpeCB0aGlzOgo+ID4KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWZzZGV2
ZWwvMjAxOTExMjIyMzUzMjQuMTcyNDUtMS1hZ3J1ZW5iYUByZWRoYXQuY29tL1QvI3QKPgo+IElu
IGdlbmVyYWwsIEkgdGhpbmsgdGhpcyBpcyBhIHNvdW5kIGFwcHJvYWNoLgo+Cj4gU3BlY2lmaWNh
bGx5LCBJIHRoaW5rIEZBVUxUX0ZMQUdfQ0FDSEVEIGNhbiBnbyBhd2F5LiAgbWFwX3BhZ2VzKCkK
PiB3aWxsIGJyaW5nIGluIHRoZSBwYWdlcyB3aGljaCBhcmUgaW4gdGhlIHBhZ2UgY2FjaGUsIHNv
IHdoZW4gd2UgZ2V0IHRvCj4gZ2ZzMl9mYXVsdCgpLCB3ZSBrbm93IHRoZXJlJ3MgYSByZWFzb24g
dG8gYWNxdWlyZSB0aGUgZ2xvY2suCgpXZSdkIHN0aWxsIGJlIGdyYWJiaW5nIGEgZ2xvY2sgd2hp
bGUgaG9sZGluZyBhIGRlcGVuZGVudCBwYWdlIGxvY2suCkFub3RoZXIgcHJvY2VzcyBjb3VsZCBi
ZSBob2xkaW5nIHRoZSBnbG9jayBhbmQgY291bGQgdHJ5IHRvIGdyYWIgdGhlCnNhbWUgcGFnZSBs
b2NrIChpLmUuLCBhIGNvbmN1cnJlbnQgd3JpdGVyKSwgbGVhZGluZyB0byB0aGUgc2FtZSBraW5k
Cm9mIGRlYWRsb2NrLgoKQW5kcmVhcwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
