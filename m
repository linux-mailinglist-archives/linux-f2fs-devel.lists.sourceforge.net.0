Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA61241A64
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Aug 2020 13:29:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k5STX-0001AO-0k; Tue, 11 Aug 2020 11:29:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@redhat.com>) id 1k5STV-0001A5-Kx
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 11:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=14mjqIexJrRyisEuU6ve1GzY3iF05TsW7M7uECeFwio=; b=SkOEtzzF9ujdJyysbYaTOe7P0e
 M0IAq5uXuPXNob44ZvLBAFlCRHc331eRH4GJHmG0Lx/79wzBKJZwAFzqejoIFG2ijnOM2vgIpTb3E
 ZeeWEqtZ6xIsn6pOZy9/1DqB/4zhzhkU1qd1TWdoa3mj18f6xB2CoZjo6ZBS0O22TWmA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=14mjqIexJrRyisEuU6ve1GzY3iF05TsW7M7uECeFwio=; b=VeLM/YrE5XDhz06K6b7Mtmy0nC
 sag4uTv87MbVmjc4YcCTt+77CZz/Xt5r+48ZfF8dCTeNtHBtYR86HL4HdFxJjiIBVDk6crtGKF8no
 GWwFbiEtPe4uERj1TN1vjJ4m/2kb9pnZeT++0gRmQbLNeFcuYSyKcIwOKduZY1dT+1kU=;
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1k5STQ-008H3N-96
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 11:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597145370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14mjqIexJrRyisEuU6ve1GzY3iF05TsW7M7uECeFwio=;
 b=JNkfZ15l65KKsNJJtzylXWL2xYx5+SEKi2ayLXRtqGXeNaXtGOLktRkffXWcAPAMIA8csC
 0mOEnDnbgsLUVQPa30kwC+Sci/3dBrneWh5AgsZJQ6QrXlYhdgzGDcKqQ99FFtCMu76ESC
 B6dQGtUa8XE/JXjC6QP7Y2UXtXKNBM8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-lvvg5eo1PMqTZ_hmix_HVA-1; Tue, 11 Aug 2020 07:29:28 -0400
X-MC-Unique: lvvg5eo1PMqTZ_hmix_HVA-1
Received: by mail-pl1-f197.google.com with SMTP id s2so8778046plr.22
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Aug 2020 04:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=pROnzIBtZcYQ6h8g+IPqvSZ4Y5L+Qp2DbB3XE4ujM9Q=;
 b=Tey3yQFDZhmbQeTtpVWZxPhTdu7q11FdUvGtTs8qWlvmuZ6tYM+1cIU+OZBscqPeJ9
 tMAvIAcmfrbMWUQs4AB3WLr/auAosUsI/qck6clkip083+qcJa9OrBXYVXk0KJz0eTCx
 rPxPf0NHMaXYiRP6LW71Pi3XGfrYkUXi/LIApD/Tc5QmvSa7pD0qnDPIRvugv0Pr+jTe
 n0PahbgppFsT46x0+BmKMK/v9zFVeWMgSlGrhZQB+MeEjc2mKw1rCp5PB0lI8DRmQTco
 cosIIjaHpSb9NsJPq0tfewqZLiKe6avZwkZrEJvTpgMiuvnuS7Zn3gqh/kf9U0shI97T
 ehAQ==
X-Gm-Message-State: AOAM531XMlYSQBhsQK8GrU/pKupqGSl67U5nwZiscbCtsXrYR3qm5zvG
 qHAr3dHGFuTJyOAovOsTMR+jhWSV59RtV6QvJGzwHrkmVH2o5deqJ5glvlLvPN+Oka+Ttpe/gAm
 e6TNs7wXKqMi+Z7Bb8Ibq+WPbbhC46/xdK+OGwg==
X-Received: by 2002:a17:902:40a:: with SMTP id 10mr496960ple.260.1597145364008; 
 Tue, 11 Aug 2020 04:29:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznrHYDqp5uPiNka0raBMIBomRr80vmIwpo5q49758OCzMM4JnefhV/fHvK+dtElpJSTFaH9g==
X-Received: by 2002:a17:902:40a:: with SMTP id 10mr496944ple.260.1597145363603; 
 Tue, 11 Aug 2020 04:29:23 -0700 (PDT)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id w9sm2576496pgg.76.2020.08.11.04.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 04:29:23 -0700 (PDT)
Date: Tue, 11 Aug 2020 19:29:12 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200811112912.GB7870@xiangao.remote.csb>
References: <20200811033753.783276-1-daeho43@gmail.com>
 <20200811071552.GA8365@xiangao.remote.csb>
 <3059d7b0-cf50-4315-e5a9-8d9c00965a7c@huawei.com>
 <CACOAw_yic7GF3E1zEvZ=Gea3XW4fMYdg-cNuu4wfg+uTKMcJqA@mail.gmail.com>
 <CACOAw_wi3C0iyTVYc3075d4K27NT7BGMGzsKFDDozf=98vWMcA@mail.gmail.com>
 <20200811101827.GA7870@xiangao.remote.csb>
 <CACOAw_zRPeGzHyc_siLqBRjURWTE61G5rGCwk7bnbcOnADGRpg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACOAw_zRPeGzHyc_siLqBRjURWTE61G5rGCwk7bnbcOnADGRpg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hsiangkao@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [207.211.31.81 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [207.211.31.81 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k5STQ-008H3N-96
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

T24gVHVlLCBBdWcgMTEsIDIwMjAgYXQgMDg6MjE6MjNQTSArMDkwMCwgRGFlaG8gSmVvbmcgd3Jv
dGU6Cj4gU3VyZSwgSSdsbCB1cGRhdGUgdGhlIHRlc3QgY29uZGl0aW9uIGFzIHlvdSBzYWlkIGlu
IHRoZSBjb21taXQgbWVzc2FnZS4KPiBGWUksIHRoZSB0ZXN0IGlzIGRvbmUgd2l0aCAxNmtiIGNo
dW5rIGFuZCBQaXhlbCAzIChhcm02NCkgZGV2aWNlLgoKWWVhaCwgYW55d2F5LCBpdCdkIGJldHRl
ciB0byBsb2NrIHRoZSBmcmVxIGFuZCBvZmZsaW5lIHRoZSBsaXR0bGUKY29yZXMgaW4geW91ciB0
ZXN0IGFzIHdlbGwgKGl0J2QgbWFrZSBtb3JlIHNlbnNlKS4gZS5nLiBpZiAxNmsgY2x1c3Rlcgpp
cyBhcHBsaWVkLCBldmVuIGFsbCBkYXRhIGlzIHplcm9lZCwgdGhlIGNvdW50IG9mIHZtYXAvdm1f
bWFwX3JhbQppc24ndCBodWdlb3VzIChhbmQgYXMgeW91IHNhaWQsICJzb21ldGltZXMsIGl0IGhh
cyBhIHZlcnkgbG9uZyBkZWxheSIsCml0J3MgbXVjaCBsaWtlIGFub3RoZXIgc2NoZWR1bGluZyBj
b25jZXJuIGFzIHdlbGwpLgoKQW55d2F5LCBJJ20gbm90IGFnYWluc3QgeW91ciBjb21taXQgYnV0
IHRoZSBjb21taXQgbWVzc2FnZSBpcyBhIGJpdApvZiB1bmNsZWFyLiBBdCBsZWFzdCwgaWYgeW91
IHRoaW5rIHRoYXQgaXMgcmVhbGx5IHRoZSBjYXNlLCBJJ20gb2sKd2l0aCB0aGF0LgoKVGhhbmtz
LApHYW8gWGlhbmcgCgo+IAo+IFRoYW5rcywKPiAKPiAyMDIww6vigKbigJ4gOMOs4oC64oCdIDEx
w6zvv73CvCAow63ihKLigJ0pIMOsy5zCpMOt4oC64oCeIDc6MTgsIEdhbyBYaWFuZyA8aHNpYW5n
a2FvQHJlZGhhdC5jb20+w6vigLnLnMOs77+9wrQgw6zFvuKAmMOs4oCewrE6Cj4gPgo+ID4gT24g
VHVlLCBBdWcgMTEsIDIwMjAgYXQgMDY6MzM6MjZQTSArMDkwMCwgRGFlaG8gSmVvbmcgd3JvdGU6
Cj4gPiA+IFBsdXMsIHdoZW4gd2UgdXNlIHZtYXAoKSwgdm1hcCgpIG5vcm1hbGx5IGV4ZWN1dGVz
IGluIGEgc2hvcnQgdGltZQo+ID4gPiBsaWtlIHZtX21hcF9yYW0oKS4KPiA+ID4gQnV0LCBzb21l
dGltZXMsIGl0IGhhcyBhIHZlcnkgbG9uZyBkZWxheS4KPiA+ID4KPiA+ID4gMjAyMMODwqvDouKC
rMKmw6LigqzFviA4w4PCrMOi4oKswrrDouKCrO+/vSAxMcODwqzDr8K/wr3DgsK8ICjDg8Ktw6Li
gJ7CosOi4oKs77+9KSDDg8Ksw4vFk8OCwqTDg8Ktw6LigqzCusOi4oKsxb4gNjoyOCwgRGFlaG8g
SmVvbmcgPGRhZWhvNDNAZ21haWwuY29tPsODwqvDouKCrMK5w4vFk8ODwqzDr8K/wr3DgsK0IMOD
wqzDhcK+w6LigqzLnMODwqzDouKCrMW+w4LCsToKPiA+ID4gPgo+ID4gPiA+IEFjdHVhbGx5LCBh
cyB5b3UgY2FuIHNlZSwgSSB1c2UgdGhlIHdob2xlIHplcm8gZGF0YSBibG9ja3MgaW4gdGhlIHRl
c3QgZmlsZS4KPiA+ID4gPiBJdCBjYW4gbWF4aW1pemUgdGhlIGVmZmVjdCBvZiBjaGFuZ2luZyB2
aXJ0dWFsIG1hcHBpbmcuCj4gPiA+ID4gV2hlbiBJIHVzZSBub3JtYWwgZmlsZXMgd2hpY2ggY2Fu
IGJlIGNvbXByZXNzZWQgYWJvdXQgNzAlIGZyb20gdGhlCj4gPiA+ID4gb3JpZ2luYWwgZmlsZSwK
PiA+ID4gPiBUaGUgdm1fbWFwX3JhbSgpIHZlcnNpb24gaXMgYWJvdXQgMnggZmFzdGVyIHRoYW4g
dm1hcCgpIHZlcnNpb24uCj4gPgo+ID4gV2hhdCBmMmZzIGRvZXMgaXMgbXVjaCBzaW1pbGFyIHRv
IGJ0cmZzIGNvbXByZXNzaW9uLiBFdmVuIGlmIHRoZXNlCj4gPiBibG9ja3MgYXJlIGFsbCB6ZXJv
ZWQuIEluIHByaW5jaXBsZSwgdGhlIG1heGltdW0gY29tcHJlc3Npb24gcmF0aW8KPiA+IGlzIGRl
dGVybWluZWQgKGNsdXN0ZXIgc2l6ZWQgYmxvY2tzIGludG8gb25lIGNvbXByZXNzZWQgYmxvY2ss
IGUuZwo+ID4gMTZrIGNsdXN0ZXIgaW50byBvbmUgY29tcHJlc3NlZCBibG9jaykuCj4gPgo+ID4g
U28gaXQnZCBiZSBiZXR0ZXIgdG8gZGVzY3JpYmUgeW91ciBjb25maWd1cmVkIGNsdXN0ZXIgc2l6
ZSAoMTZrIG9yCj4gPiAxMjhrKSBhbmQgeW91ciBoYXJkd2FyZSBpbmZvcm1hdGlvbiBpbiB0aGUg
Y29tbWl0IG1lc3NhZ2UgYXMgd2VsbC4KPiA+Cj4gPiBBY3R1YWxseSwgSSBhbHNvIHRyaWVkIHdp
dGggdGhpcyBwYXRjaCBhcyB3ZWxsIG9uIG15IHg4NiBsYXB0b3AganVzdAo+ID4gbm93IHdpdGgg
RklPIChJIGRpZG4ndCB1c2UgemVyb2VkIGJsb2NrIHRob3VnaCksIGFuZCBJIGRpZG4ndCBub3Rp
Y2UKPiA+IG11Y2ggZGlmZmVyZW5jZSB3aXRoIHR1cmJvIGJvb3N0IG9mZiBhbmQgbWF4ZnJlcS4K
PiA+Cj4gPiBJJ20gbm90IGFyZ3VpbmcgdGhpcyBjb21taXQsIGp1c3QgYSBub3RlIGFib3V0IHRo
aXMgY29tbWl0IG1lc3NhZ2UuCj4gPiA+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykg
Y29waWVkLCA5LjE0NjIxNyBzLCAxMDkgTS9zCj4gPiA+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVz
ICgwLjkgRykgY29waWVkLCA5Ljk5NzU0MiBzLCAxMDAgTS9zCj4gPiA+ID4gPiA+PiAxMDQ4NTc2
MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCAxMC4xMDk3MjcgcywgOTkgTS9zCj4gPgo+ID4gSU1I
TywgdGhlIGFib3ZlIG51bWJlciBpcyBtdWNoIGxpa2UgZGVjb21wcmVzc2luZyBpbiB0aGUgYXJt
NjQgbGl0dGxlIGNvcmVzLgo+ID4KPiA+IFRoYW5rcywKPiA+IEdhbyBYaWFuZwo+ID4KPiA+Cj4g
PiA+ID4KPiA+ID4gPiAyMDIww4PCq8Oi4oKswqbDouKCrMW+IDjDg8Ksw6LigqzCusOi4oKs77+9
IDExw4PCrMOvwr/CvcOCwrwgKMODwq3DouKAnsKiw6Ligqzvv70pIMODwqzDi8WTw4LCpMODwq3D
ouKCrMK6w6LigqzFviA0OjU1LCBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+w4PCq8Oi4oKs
wrnDi8WTw4PCrMOvwr/CvcOCwrQgw4PCrMOFwr7DouKCrMucw4PCrMOi4oKsxb7DgsKxOgo+ID4g
PiA+ID4KPiA+ID4gPiA+IE9uIDIwMjAvOC8xMSAxNToxNSwgR2FvIFhpYW5nIHdyb3RlOgo+ID4g
PiA+ID4gPiBPbiBUdWUsIEF1ZyAxMSwgMjAyMCBhdCAxMjozNzo1M1BNICswOTAwLCBEYWVobyBK
ZW9uZyB3cm90ZToKPiA+ID4gPiA+ID4+IEZyb206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdv
b2dsZS5jb20+Cj4gPiA+ID4gPiA+Pgo+ID4gPiA+ID4gPj4gQnkgcHJvZmlsaW5nIGYyZnMgY29t
cHJlc3Npb24gd29ya3MsIEkndmUgZm91bmQgdm1hcCgpIGNhbGxpbmdzIGFyZQo+ID4gPiA+ID4g
Pj4gYm90dGxlbmVja3Mgb2YgZjJmcyBkZWNvbXByZXNzaW9uIHBhdGguIENoYW5naW5nIHRoZXNl
IHdpdGgKPiA+ID4gPiA+ID4+IHZtX21hcF9yYW0oKSwgd2UgY2FuIGVuaGFuY2UgZjJmcyBkZWNv
bXByZXNzaW9uIHNwZWVkIHByZXR0eSBtdWNoLgo+ID4gPiA+ID4gPj4KPiA+ID4gPiA+ID4+IFtW
ZXJpZmljYXRpb25dCj4gPiA+ID4gPiA+PiBkZCBpZj0vZGV2L3plcm8gb2Y9ZHVtbXkgYnM9MW0g
Y291bnQ9MTAwMAo+ID4gPiA+ID4gPj4gZWNobyAzID4gL3Byb2Mvc3lzL3ZtL2Ryb3BfY2FjaGVz
Cj4gPiA+ID4gPiA+PiBkZCBpZj1kdW1teSBvZj0vZGV2L3plcm8gYnM9NTEyawo+ID4gPiA+ID4g
Pj4KPiA+ID4gPiA+ID4+IC0gdy9vIGNvbXByZXNzaW9uIC0KPiA+ID4gPiA+ID4+IDEwNDg1NzYw
MDAgYnl0ZXMgKDAuOSBHKSBjb3BpZWQsIDEuOTk5Mzg0IHMsIDUwMCBNL3MKPiA+ID4gPiA+ID4+
IDEwNDg1NzYwMDAgYnl0ZXMgKDAuOSBHKSBjb3BpZWQsIDIuMDM1OTg4IHMsIDQ5MSBNL3MKPiA+
ID4gPiA+ID4+IDEwNDg1NzYwMDAgYnl0ZXMgKDAuOSBHKSBjb3BpZWQsIDIuMDM5NDU3IHMsIDQ5
MCBNL3MKPiA+ID4gPiA+ID4+Cj4gPiA+ID4gPiA+PiAtIGJlZm9yZSBwYXRjaCAtCj4gPiA+ID4g
PiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCA5LjE0NjIxNyBzLCAxMDkgTS9z
Cj4gPiA+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCA5Ljk5NzU0MiBz
LCAxMDAgTS9zCj4gPiA+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCAx
MC4xMDk3MjcgcywgOTkgTS9zCj4gPiA+ID4gPiA+Pgo+ID4gPiA+ID4gPj4gLSBhZnRlciBwYXRj
aCAtCj4gPiA+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCAyLjI1MzQ0
MSBzLCA0NDQgTS9zCj4gPiA+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVk
LCAyLjczOTc2NCBzLCAzNjUgTS9zCj4gPiA+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkg
RykgY29waWVkLCAyLjE4NTY0OSBzLCA0NTggTS9zCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IElu
ZGVlZCwgdm1hcCgpIGFwcHJvYWNoIGhhcyBzb21lIGltcGFjdCBvbiB0aGUgd2hvbGUKPiA+ID4g
PiA+ID4gd29ya2Zsb3cuIEJ1dCBJIGRvbid0IHRoaW5rIHRoZSBnYXAgaXMgc3VjaCBzaWduaWZp
Y2FudCwKPiA+ID4gPiA+ID4gbWF5YmUgaXQgcmVsYXRlcyB0byB1bmxvY2tlZCBjcHVmcmVxIChh
bmQgYmlnIGxpdHRsZQo+ID4gPiA+ID4gPiBjb3JlIGRpZmZlcmVuY2UgaWYgaXQncyBvbiBzb21l
IGFybTY0IGJvYXJkKS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBBZ3JlZWQsCj4gPiA+ID4gPgo+ID4g
PiA+ID4gSSBndWVzcyB0aGVyZSBzaG91bGQgYmUgb3RoZXIgcmVhc29uIGNhdXNpbmcgdGhlIGxh
cmdlIHBlcmZvcm1hbmNlCj4gPiA+ID4gPiBnYXAsIHNjaGVkdWxpbmcsIGZyZXF1ZW5jeSwgb3Ig
c29tZXRoaW5nIGVsc2UuCj4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+ID4gPiA+ID4gPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gPiA+
ID4gPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4gPiA+ID4gPiBo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCj4gPiA+ID4gPiA+IC4KPiA+ID4gPiA+ID4KPiA+ID4KPiA+Cj4gCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
