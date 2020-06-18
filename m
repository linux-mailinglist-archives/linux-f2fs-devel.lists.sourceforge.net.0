Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 357CE1FF96E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 18:40:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlxaj-0002jV-LI; Thu, 18 Jun 2020 16:40:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <agruenba@redhat.com>) id 1jlxai-0002jO-53
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 16:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K+ZmXo1VT3DgmlBxctO5wOawFr9Ym28t9PdelfkR48g=; b=RHY2G4ioTMNymtAa2OcfS9H4Ww
 73IxW4IaWYq2skKKt0H5qKimxn/pin949N5p/0GAKZgAyHNaOQjKkPFKvjz9RKOAvXsIU9z7lWHeS
 B8JK77LtXxVVCmgrBj0xjcRDKXEEAQjSMT4DUj5HtVXI4aCyEfb8HAeSrikpAzeAnvqk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K+ZmXo1VT3DgmlBxctO5wOawFr9Ym28t9PdelfkR48g=; b=I7YWnsLI+0c26BctPUYKJcLh+Z
 aVm0CraMI1+WFxFG9CNImN5jLXXEF1WGxV+qIpw6eMGNQWp/poFaG23IPWvL19nzaGcE34eE7BTZ9
 XEDudxvMT264wnBfz8UaXUCMBxfHU3CmLT6BzYiWg247ndGN306KPe6LpNihSCzRc0O4=;
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1jlxaf-007xcZ-Uu
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 16:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592498431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K+ZmXo1VT3DgmlBxctO5wOawFr9Ym28t9PdelfkR48g=;
 b=YR68qKkL+bfSc68qDoNfVSDEBRWj2ONkpBNzsPGKc/b5zhdMZ23jFiCWwguxikP7XcpLfD
 57GpFXX+wBuQtf3V+vUaJedJTB6fBRFauPV4kMHw5uMP/7CkB+U7+6jA8IWwnQsFuG/U4b
 Al1H/p8FS4VvxPiB5f+vkQJYTYCloEM=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-Tg2p-v6oMGOO3084seXq-A-1; Thu, 18 Jun 2020 12:40:28 -0400
X-MC-Unique: Tg2p-v6oMGOO3084seXq-A-1
Received: by mail-ot1-f70.google.com with SMTP id s62so2883648otb.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Jun 2020 09:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K+ZmXo1VT3DgmlBxctO5wOawFr9Ym28t9PdelfkR48g=;
 b=HxXajnCwz1wCdoNsjo5LxtworEiB4zNSZtOpdGjKbrCarFhjhoudNyO8FyNDdgJqE/
 hB6xt/VZ3A9LB+VcCPnfM56YKFYJn8+AiVVoLXKhL5zgqtrYfG/le6vW/W4NDVsgws1x
 sARfGeMp1bp4usT8mG+SLjJRd1TzCjxvWRnGbcb9lfHscMfEovW6gW/LBAnCPaX8ms4r
 p7mib/2xMHGwJ/To/efQx6zEW9FX84ykYSRjanza83vyMjfCHyNA/PLi1A/D4BZQC48l
 /gX7lsOnqPb0IIOBIFxuqjs8yM3CugeqxKjqI39AHhrXiqJDG/3uTEe4AJxUJY9ET3PU
 f1TA==
X-Gm-Message-State: AOAM533Yq9Vb/ICKOAF9PHL4uSuHiYg2hfxKL483+RZ71A+4Lt3GVxME
 dVGgd7TNjeN+AmNu3SbG616tQ7Px2E25nMjipGR7JXvMrXkjnFOIcWLbysIcSBJIKphDzqIJks5
 jqpKh1y9WFMsY2xcuZOcSJgIXyw5i8GnQJFG5n33tC+2pq5tC/5/VSg==
X-Received: by 2002:a05:6830:10c8:: with SMTP id
 z8mr4000195oto.95.1592498427405; 
 Thu, 18 Jun 2020 09:40:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE8nhb2Q0d4GxQpaInRB14NGapvcWpYnTg96Ky3B2ltZU9DxgAABVkj/Ptn9PHhgl8mMoH1G9lpq5ufccfhow=
X-Received: by 2002:a05:6830:10c8:: with SMTP id
 z8mr4000168oto.95.1592498427103; 
 Thu, 18 Jun 2020 09:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200414150233.24495-1-willy@infradead.org>
 <20200414150233.24495-17-willy@infradead.org>
 <CAHc6FU4m1M7Tv4scX0UxSiVBqkL=Vcw_z-R7SufL8k7Bw=qPOw@mail.gmail.com>
 <20200617003216.GC8681@bombadil.infradead.org>
 <CAHpGcMK6Yu0p-FO8CciiySqh+qcWLG-t3hEaUg-rqJnS=2uhqg@mail.gmail.com>
 <20200617022157.GF8681@bombadil.infradead.org>
 <CAHc6FU7NLRHKRJJ6c2kQT0ig8ed1n+3qR-YcSCWzXOeJCUsLbA@mail.gmail.com>
 <20200618150309.GP8681@bombadil.infradead.org>
In-Reply-To: <20200618150309.GP8681@bombadil.infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 18 Jun 2020 18:40:15 +0200
Message-ID: <CAHc6FU6TYTiQ0a0GkN1dhh3VeQKVKrL+eALvuYzZ8nq5jvNHjg@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [205.139.110.120 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.120 listed in wl.mailspike.net]
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
X-Headers-End: 1jlxaf-007xcZ-Uu
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

T24gVGh1LCBKdW4gMTgsIDIwMjAgYXQgNTowMyBQTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5m
cmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1biAxOCwgMjAyMCBhdCAwMjo0NjowM1BN
ICswMjAwLCBBbmRyZWFzIEdydWVuYmFjaGVyIHdyb3RlOgo+ID4gT24gV2VkLCBKdW4gMTcsIDIw
MjAgYXQgNDoyMiBBTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4gd3JvdGU6
Cj4gPiA+IE9uIFdlZCwgSnVuIDE3LCAyMDIwIGF0IDAyOjU3OjE0QU0gKzAyMDAsIEFuZHJlYXMg
R3LDg8K8bmJhY2hlciB3cm90ZToKPiA+ID4gPiBSaWdodCwgdGhlIGFwcHJvYWNoIGZyb20gdGhl
IGZvbGxvd2luZyB0aHJlYWQgbWlnaHQgZml4IHRoaXM6Cj4gPiA+ID4KPiA+ID4gPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1mc2RldmVsLzIwMTkxMTIyMjM1MzI0LjE3MjQ1LTEtYWdy
dWVuYmFAcmVkaGF0LmNvbS9ULyN0Cj4gPiA+Cj4gPiA+IEluIGdlbmVyYWwsIEkgdGhpbmsgdGhp
cyBpcyBhIHNvdW5kIGFwcHJvYWNoLgo+ID4gPgo+ID4gPiBTcGVjaWZpY2FsbHksIEkgdGhpbmsg
RkFVTFRfRkxBR19DQUNIRUQgY2FuIGdvIGF3YXkuICBtYXBfcGFnZXMoKQo+ID4gPiB3aWxsIGJy
aW5nIGluIHRoZSBwYWdlcyB3aGljaCBhcmUgaW4gdGhlIHBhZ2UgY2FjaGUsIHNvIHdoZW4gd2Ug
Z2V0IHRvCj4gPiA+IGdmczJfZmF1bHQoKSwgd2Uga25vdyB0aGVyZSdzIGEgcmVhc29uIHRvIGFj
cXVpcmUgdGhlIGdsb2NrLgo+ID4KPiA+IFdlJ2Qgc3RpbGwgYmUgZ3JhYmJpbmcgYSBnbG9jayB3
aGlsZSBob2xkaW5nIGEgZGVwZW5kZW50IHBhZ2UgbG9jay4KPiA+IEFub3RoZXIgcHJvY2VzcyBj
b3VsZCBiZSBob2xkaW5nIHRoZSBnbG9jayBhbmQgY291bGQgdHJ5IHRvIGdyYWIgdGhlCj4gPiBz
YW1lIHBhZ2UgbG9jayAoaS5lLiwgYSBjb25jdXJyZW50IHdyaXRlciksIGxlYWRpbmcgdG8gdGhl
IHNhbWUga2luZAo+ID4gb2YgZGVhZGxvY2suCj4KPiBXaGF0IEknbSBzYXlpbmcgaXMgdGhhdCBn
ZnMyX2ZhdWx0IHNob3VsZCBqdXN0IGJlOgo+Cj4gK3N0YXRpYyB2bV9mYXVsdF90IGdmczJfZmF1
bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCj4gK3sKPiArICAgICAgIHN0cnVjdCBpbm9kZSAqaW5v
ZGUgPSBmaWxlX2lub2RlKHZtZi0+dm1hLT52bV9maWxlKTsKPiArICAgICAgIHN0cnVjdCBnZnMy
X2lub2RlICppcCA9IEdGUzJfSShpbm9kZSk7Cj4gKyAgICAgICBzdHJ1Y3QgZ2ZzMl9ob2xkZXIg
Z2g7Cj4gKyAgICAgICB2bV9mYXVsdF90IHJldDsKPiArICAgICAgIGludCBlcnI7Cj4gKwo+ICsg
ICAgICAgZ2ZzMl9ob2xkZXJfaW5pdChpcC0+aV9nbCwgTE1fU1RfU0hBUkVELCAwLCAmZ2gpOwo+
ICsgICAgICAgZXJyID0gZ2ZzMl9nbG9ja19ucSgmZ2gpOwo+ICsgICAgICAgaWYgKGVycikgewo+
ICsgICAgICAgICAgICAgICByZXQgPSBibG9ja19wYWdlX21rd3JpdGVfcmV0dXJuKGVycik7Cj4g
KyAgICAgICAgICAgICAgIGdvdG8gb3V0X3VuaW5pdDsKPiArICAgICAgIH0KPiArICAgICAgIHJl
dCA9IGZpbGVtYXBfZmF1bHQodm1mKTsKPiArICAgICAgIGdmczJfZ2xvY2tfZHEoJmdoKTsKPiAr
b3V0X3VuaW5pdDoKPiArICAgICAgIGdmczJfaG9sZGVyX3VuaW5pdCgmZ2gpOwo+ICsgICAgICAg
cmV0dXJuIHJldDsKPiArfQo+Cj4gYmVjYXVzZSBieSB0aGUgdGltZSBnZnMyX2ZhdWx0KCkgaXMg
Y2FsbGVkLCBtYXBfcGFnZXMoKSBoYXMgYWxyZWFkeSBiZWVuCj4gY2FsbGVkIGFuZCBoYXMgZmFp
bGVkIHRvIGluc2VydCB0aGUgbmVjZXNzYXJ5IHBhZ2UsIHNvIHdlIHNob3VsZCBqdXN0Cj4gYWNx
dWlyZSB0aGUgZ2xvY2sgbm93IGluc3RlYWQgb2YgdHJ5aW5nIGFnYWluIHRvIGxvb2sgZm9yIHRo
ZSBwYWdlIGluCj4gdGhlIHBhZ2UgY2FjaGUuCgpPa2F5LCB0aGF0J3MgZ3JlYXQuCgpUaGFua3Ms
CkFuZHJlYXMKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
