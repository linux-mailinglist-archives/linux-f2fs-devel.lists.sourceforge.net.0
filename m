Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EECB06A6C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jul 2025 02:28:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:References:To:From:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SprCt0eROAa+RrBGYjMkDSd2uVKmYY3LUuB2MKGLTaU=; b=b6VIF+yqJdFgmtPo6GUHu+r4yn
	1Nxz/gj2gnzRbL+cfdU0kZfk3QQSUACa3l/BRSUVMi9SbxI2f1bmQMuAJE8OfIaqAtwfxB+utn6tf
	6BTnwm21gg2EMhs4ms6ptrG3+QBiPEpY70RA+1cvdnzrBaCV4fJYSkeaRd0UPACR0YfE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubq0e-0003SV-48;
	Wed, 16 Jul 2025 00:28:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hsiangkao@linux.alibaba.com>) id 1ubq0c-0003SF-BW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Jul 2025 00:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LbjcxXFKh7BwDlSh88rF8t3KBJnwLKqPh8QSBj+K9Y8=; b=kU1K558Td2Q7mbkhZtaKxt2RDa
 s0URt/lk09jKeCJKaXnJdDveVKiErw4CEKbmU/JP+G/91dNRAcMtOjFmoyf9pxuesHA4PZXtrn/dD
 H9iNvnhlCTMWcKeFmhrGK0ytPjk/HeUJD+y+2HvLMOoP97quCyv19RUyCxynU8mGgBmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LbjcxXFKh7BwDlSh88rF8t3KBJnwLKqPh8QSBj+K9Y8=; b=nOD9zBdqR99cixJN2xJEcuW58q
 UvBH8hPTdDBAVGNtSadxLwRyahTBmTB3Dmre88rlW3BApOQhIWlI2KKPDxXfIc8wbHNHWcpob08Ou
 E6TRlTGTk7TZiId08B6vipk0kztNG5sBaeKma+nQR/G75ThDVtw5ayVvh9VuSCZKg7Hg=;
Received: from [115.124.30.124] (helo=out30-124.freemail.mail.aliyun.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ubq0b-0003Ub-UU for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Jul 2025 00:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1752625698; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
 bh=LbjcxXFKh7BwDlSh88rF8t3KBJnwLKqPh8QSBj+K9Y8=;
 b=oNO8LIxJ9JKzFhhufSxxzDFVSYo+r5lJyctwIsPNfTE4pjJWxDp8ALbNDauIeSoY1+yhEvRKIiaB2h51jf+0ypYmfuLEo+YXZT0PLwPG3NMyYmB8tdFUsQoYLXtSOlzKo0ptsdnC3YcAr8HiKGOR8wnJLKGPdS8IDGASPyKzibY=
Received: from 30.170.233.0(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0Wj1msOW_1752625684 cluster:ay36) by smtp.aliyun-inc.com;
 Wed, 16 Jul 2025 08:28:15 +0800
Message-ID: <b61c4b7f-4bb1-4551-91ba-a0e0ffd19e75@linux.alibaba.com>
Date: Wed, 16 Jul 2025 08:28:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 linux-btrfs@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-erofs@lists.ozlabs.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Howells <dhowells@redhat.com>, netfs@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, Steve French <sfrench@samba.org>,
 linux-cifs@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Hailong Liu <hailong.liu@oppo.com>, Barry Song <21cnbao@gmail.com>,
 Qu Wenruo <quwenruo.btrfs@gmx.com>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
In-Reply-To: <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/7/16 07:32, Gao Xiang wrote: > Hi Matthew, > > On
 2025/7/16 04:40, Matthew Wilcox wrote: >> I've started looking at how the
 page cache can help filesystems handle >> compressed data better. Fe [...]
 Content analysis details:   (-6.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: googlesource.com]
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1ubq0b-0003Ub-UU
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiAyMDI1LzcvMTYgMDc6MzIsIEdhbyBYaWFuZyB3cm90ZToKPiBIaSBNYXR0aGV3LAo+IAo+
IE9uIDIwMjUvNy8xNiAwNDo0MCwgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4+IEkndmUgc3RhcnRl
ZCBsb29raW5nIGF0IGhvdyB0aGUgcGFnZSBjYWNoZSBjYW4gaGVscCBmaWxlc3lzdGVtcyBoYW5k
bGUKPj4gY29tcHJlc3NlZCBkYXRhIGJldHRlci7CoCBGZWVkYmFjayB3b3VsZCBiZSBhcHByZWNp
YXRlZCHCoCBJJ2xsIHByb2JhYmx5Cj4+IHNheSBhIGZldyB0aGluZ3Mgd2hpY2ggYXJlIG9idmlv
dXMgdG8gYW55b25lIHdobyBrbm93cyBob3cgY29tcHJlc3NlZAo+PiBmaWxlcyB3b3JrLCBidXQg
SSdtIHRyeWluZyB0byBiZSBleHBsaWNpdCBhYm91dCBteSBhc3N1bXB0aW9ucy4KPj4KPj4gRmly
c3QsIEkgYmVsaWV2ZSB0aGF0IGFsbCBmaWxlc3lzdGVtcyB3b3JrIGJ5IGNvbXByZXNzaW5nIGZp
eGVkLXNpemUKPj4gcGxhaW50ZXh0IGludG8gdmFyaWFibGUtc2l6ZWQgY29tcHJlc3NlZCBibG9j
a3MuwqAgVGhpcyB3b3VsZCBiZSBhIGdvb2QKPj4gcG9pbnQgdG8gc3RvcCByZWFkaW5nIGFuZCB0
ZWxsIG1lIGFib3V0IGNvdW50ZXJleGFtcGxlcy4KPiAKPiBBdCBsZWFzdCB0aGUgdHlwaWNhbCBF
Uk9GUyBjb21wcmVzc2VzIHZhcmlhYmxlLXNpemVkIHBsYWludGV4dCAoYXQgbGVhc3QKPiBvbmUg
YmxvY2ssIGUuZy4gNGssIGJ1dCBhbHNvIDRrKzEsIDRrKzIsIC4uLikgaW50byBmaXhlZC1zaXpl
ZCBjb21wcmVzc2VkCj4gYmxvY2tzIGZvciBlZmZpY2llbnQgSS9Pcywgd2hpY2ggaXMgcmVhbGx5
IHVzZWZ1bCBmb3Igc21hbGwgY29tcHJlc3Npb24KPiBncmFudWxhcml0eSAoZS5nLiA0S2lCLCA4
S2lCKSBiZWNhdXNlIHVzZSBjYXNlcyBsaWtlIEFuZHJvaWQgYXJlIHVzdWFsbHkKPiB1bmRlciBt
ZW1vcnkgcHJlc3N1cmUgc28gbGFyZ2UgY29tcHJlc3Npb24gZ3JhbnVsYXJpdHkgaXMgYWxtb3N0
Cj4gdW5hY2NlcHRhYmxlIGluIHRoZSBsb3cgbWVtb3J5IHNjZW5hcmlvcywgc2VlOgo+IGh0dHBz
Oi8vZXJvZnMuZG9jcy5rZXJuZWwub3JnL2VuL2xhdGVzdC9kZXNpZ24uaHRtbAo+IAo+IEN1cnJl
bnRseSBFUk9GUyB3b3JrcyBwcmV0dHkgd2VsbCBvbiB0aGVzZSBkZXZpY2VzIGFuZCBoYXMgYmVl
bgo+IHN1Y2Nlc3NmdWxseSBkZXBsb3llZCBpbiBiaWxsaW9ucyBvZiByZWFsIGRldmljZXMuCj4g
Cj4+Cj4+IMKgRnJvbSB3aGF0IEkndmUgYmVlbiByZWFkaW5nIGluIGFsbCB5b3VyIGZpbGVzeXN0
ZW1zIGlzIHRoYXQgeW91IHdhbnQgdG8KPj4gYWxsb2NhdGUgZXh0cmEgcGFnZXMgaW4gdGhlIHBh
Z2UgY2FjaGUgaW4gb3JkZXIgdG8gc3RvcmUgdGhlIGV4Y2VzcyBkYXRhCj4+IHJldHJpZXZlZCBh
bG9uZyB3aXRoIHRoZSBwYWdlIHRoYXQgeW91J3JlIGFjdHVhbGx5IHRyeWluZyB0byByZWFkLsKg
IFRoYXQncwo+PiBiZWNhdXNlIGNvbXByZXNzaW5nIGluIGxhcmdlciBjaHVua3MgbGVhZHMgdG8g
YmV0dGVyIGNvbXByZXNzaW9uLgo+Pgo+PiBUaGVyZSdzIHNvbWUgZGlzY3JlcGFuY3kgYmV0d2Vl
biBmaWxlc3lzdGVtcyB3aGV0aGVyIHlvdSBuZWVkIHNjcmF0Y2gKPj4gc3BhY2UgZm9yIGRlY29t
cHJlc3Npb24uwqAgU29tZSBmaWxlc3lzdGVtcyByZWFkIHRoZSBjb21wcmVzc2VkIGRhdGEgaW50
bwo+PiB0aGUgcGFnZWNhY2hlIGFuZCBkZWNvbXByZXNzIGluLXBsYWNlLCB3aGlsZSBvdGhlciBm
aWxlc3lzdGVtcyByZWFkIHRoZQo+PiBjb21wcmVzc2VkIGRhdGEgaW50byBzY3JhdGNoIHBhZ2Vz
IGFuZCBkZWNvbXByZXNzIGludG8gdGhlIHBhZ2UgY2FjaGUuCj4+Cj4+IFRoZXJlIGFsc28gc2Vl
bXMgdG8gYmUgc29tZSBkaXNjcmVwYW5jeSBiZXR3ZWVuIGZpbGVzeXN0ZW1zIHdoZXRoZXIgdGhl
Cj4+IGRlY29tcHJlc3Npb24gaW52b2x2ZXMgdm1hcCgpIG9mIGFsbCB0aGUgbWVtb3J5IGFsbG9j
YXRlZCBvciB3aGV0aGVyIHRoZQo+PiBkZWNvbXByZXNzaW9uIHJvdXRpbmVzIGNhbiBoYW5kbGUg
ZG9pbmcga21hcF9sb2NhbCgpIG9uIGluZGl2aWR1YWwgcGFnZXMuCj4+Cj4+IFNvLCBteSBwcm9w
b3NhbCBpcyB0aGF0IGZpbGVzeXN0ZW1zIHRlbGwgdGhlIHBhZ2UgY2FjaGUgdGhhdCB0aGVpciBt
aW5pbXVtCj4+IGZvbGlvIHNpemUgaXMgdGhlIGNvbXByZXNzaW9uIGJsb2NrIHNpemUuwqAgVGhh
dCBzZWVtcyB0byBiZSBhcm91bmQgNjRrLAo+PiBzbyBub3QgYW4gdW5yZWFzb25hYmxlIG1pbmlt
dW0gYWxsb2NhdGlvbiBzaXplLsKgIFRoYXQgcmVtb3ZlcyBhbGwgdGhlCj4+IGV4dHJhIGNvZGUg
aW4gZmlsZXN5c3RlbXMgdG8gYWxsb2NhdGUgZXh0cmEgbWVtb3J5IGluIHRoZSBwYWdlIGNhY2hl
Lj4gSXQgbWVhbnMgd2UgZG9uJ3QgYXR0ZW1wdCB0byB0cmFjayBkaXJ0aW5lc3MgYXQgYSBzdWIt
Zm9saW8gZ3JhbnVsYXJpdHkKPj4gKHRoZXJlJ3Mgbm8gcG9pbnQsIHdlIGhhdmUgdG8gd3JpdGUg
YmFjayB0aGUgZW50aXJlIGNvbXByZXNzZWQgYm9jawo+PiBhdCBvbmNlKS7CoCBXZSBhbHNvIGdl
dCBhIHNpbmdsZSB2aXJ0dWFsbHkgY29udGlndW91cyBibG9jayAuLi4gaWYgeW91J3JlCj4+IHdp
bGxpbmcgdG8gZGl0Y2ggSElHSE1FTSBzdXBwb3J0LsKgIE9yIHRoZXJlJ3MgYSBwcm9wb3NhbCB0
byBpbnRyb2R1Y2UgYQo+PiB2bWFwX2ZpbGUoKSB3aGljaCB3b3VsZCBnaXZlIHVzIGEgdmlydHVh
bGx5IGNvbnRpZ3VvdXMgY2h1bmsgb2YgbWVtb3J5Cj4+IChhbmQgY291bGQgYmUgdHJpdmlhbGx5
IHR1cm5lZCBpbnRvIGEgbm9vcCBmb3IgdGhlIGNhc2Ugb2YgdHJ5aW5nIHRvCj4+IHZtYXAgYSBz
aW5nbGUgbGFyZ2UgZm9saW8pLgo+IAo+IEkgZG9uJ3Qgc2VlIHRoaXMgd2lsbCB3b3JrIGZvciBF
Uk9GUyBiZWNhdXNlIEVST0ZTIGFsd2F5cyBzdXBwb3J0cwo+IHZhcmlhYmxlIHVuY29tcHJlc3Nl
ZCBleHRlbnQgbGVuZ3RocyBhbmQgdGhhdCB3aWxsIGJyZWFrIHR5cGljYWwKPiBFUk9GUyB1c2Ug
Y2FzZXMgYW5kIG9uLWRpc2sgZm9ybWF0cy4KPiAKPiBPdGhlciB0aGluZyBpcyB0aGF0IGxhcmdl
IG9yZGVyIGZvbGlvcyAocGh5c2ljYWwgY29uc2VjdXRpdmUpIHdpbGwKPiBjYXVzZWQgImluY3Jl
YXNlIHRoZSBsYXRlbmN5IG9uIFVYIHRhc2sgd2l0aCBmaWxlbWFwX2ZhdWx0KCkiCj4gYmVjYXVz
ZSBvZiBoaWdoLW9yZGVyIGRpcmVjdCByZWNsYWltcywgc2VlOgo+IGh0dHBzOi8vYW5kcm9pZC1y
ZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2tlcm5lbC9jb21tb24vKy8zNjkyMzMzCj4gc28gRVJP
RlMgd2lsbCBub3Qgc2V0IG1pbi1vcmRlciBhbmQgYWx3YXlzIHN1cHBvcnQgb3JkZXItMCBmb2xp
b3MuCj4gCj4gSSB0aGluayBFUk9GUyB3aWxsIG5vdCB1c2UgdGhpcyBuZXcgYXBwcm9hY2gsIHZt
YXAoKSBpbnRlcmZhY2UgaXMKPiBhbHdheXMgdGhlIGNhc2UgZm9yIHVzLgoKLi4uIGhpZ2gtb3Jk
ZXIgZm9saW9zIGNhbiBjYXVzZSBzaWRlIGVmZmVjdHMgb24gZW1iZWRkZWQgZGV2aWNlcwpsaWtl
IHJvdXRlcnMgYW5kIElvVCBkZXZpY2VzLCB3aGljaCBzdGlsbCBoYXZlIE1pQnMgb2YgbWVtb3J5
IChhbmQgSQpiZWxpZXZlIHRoaXMgd29uJ3QgY2hhbmdlIGR1ZSB0byB0aGVpciB1c2UgY2FzZXMp
IGJ1dCB0aGV5IGFsc28gdXNlCkxpbnV4IGtlcm5lbCBmb3IgcXVpdGUgbG9uZyB0aW1lLiAgSW4g
c2hvcnQsIEkgZG9uJ3QgdGhpbmsgZW5hYmxpbmcKbGFyZ2UgZm9saW9zIGZvciB0aG9zZSBkZXZp
Y2VzIGlzIHZlcnkgdXNlZnVsLCBsZXQgYWxvbmUgbGltaXRpbmcKdGhlIG1pbmltdW0gZm9saW8g
b3JkZXIgZm9yIHRoZW0gKEl0IHdvdWxkIG1ha2UgdGhlIGZpbGVzeXN0ZW0gbm90CnN1aXRhYmxl
IGFueSBtb3JlIGZvciB0aG9zZSB1c2Vycy4gIEF0IGxlYXN0IHRoYXQgaXMgd2hhdCBJIG5ldmVy
CndhbnQgdG8gZG8pLiAgQW5kIEkgYmVsaWV2ZSB0aGlzIGlzIGRpZmZlcmVudCBmcm9tIHRoZSBj
dXJyZW50IExCUwpzdXBwb3J0IHRvIG1hdGNoIGhhcmR3YXJlIGNoYXJhY3RlcmlzdGljcyBvciBM
QlMgYXRvbWljIHdyaXRlCnJlcXVpcmVtZW50LgoKQlRXLCBBRkFJSywgdGhlcmUgYXJlIGFsc28g
Y29tcHJlc3Npb24gb3B0aW1pemF0aW9uIHRyaWNrcyByZWxhdGVkCnRvIENPVyAobGlrZSB3aGF0
IEJ0cmZzIGN1cnJlbnRseSBkb2VzKSBvciB3cml0ZSBvcHRpbWl6YXRpb25zLAp3aGljaCB3b3Vs
ZCBhbHNvIGJyZWFrIHRoaXMuCgpGb3IgZXhhbXBsZSwgcmVjb21wcmVzc2luZyBhbiBlbnRpcmUg
Y29tcHJlc3NlZCBleHRlbnQgd2hlbiBhIHVzZXIKdXBkYXRlcyBqdXN0IG9uZSBzcGVjaWZpYyBm
aWxlIGJsb2NrIChjb25zaWRlciByYW5kb20gZGF0YSB1cGRhdGVzKQppcyBpbmVmZmljaWVudC4g
RmlsZXN5c3RlbXMgbWF5IHdyaXRlIHRoZSBibG9jayBhcyB1bmNvbXByZXNzZWQgZGF0YQppbml0
aWFsbHkgKHNpbmNlIHJlY29tcHJlc3NpbmcgdGhlIHdob2xlIGV4dGVudCB3b3VsZCBiZSBDUFUt
aW50ZW5zaXZlCmFuZCBjYXVzZSB3cml0ZSBhbXBsaWZpY2F0aW9uKSBhbmQgdGhlbiBjb25zaWRl
ciByZWNvbXByZXNzaW5nIGl0CmR1cmluZyBiYWNrZ3JvdW5kIGdhcmJhZ2UgY29sbGVjdGlvbiBv
ciB3aGVuIHRoZXJlIGFyZSBlbm91Z2ggYmxvY2tzCmhhdmUgYmVlbiB3cml0dGVuIHRvIGp1c3Rp
ZnkgcmVjb21wcmVzc2lvbiBvZiB0aGUgb3JpZ2luYWwgZXh0ZW50LgoKVGhlIEJ0cmZzIENPVyBj
YXNlIHdhcyBhbHNvIHBvaW50ZWQgb3V0IGJ5IFdlbnJ1byBpbiB0aGUgcHJldmlvdXMKdGhyZWFk
OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzYyZjVmNjhkLTdlM2YtOTIzOC01NDE3LWM2NGQ4
ZGNmMjIxNEBnbXguY29tCgpUaGFua3MsCkdhbyBYaWFuZwoKPiAKPiBUaGFua3MsCj4gR2FvIFhp
YW5nCj4gCj4+Cj4gCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
