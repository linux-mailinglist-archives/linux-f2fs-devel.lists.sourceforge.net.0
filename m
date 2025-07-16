Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A25B06D52
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jul 2025 07:40:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1l0ZOv9ps+qxuEmymIqsNITdxIiNUavt07Ux5C64Uo=; b=jnApEHbjCTXxmTz/LKSt5+6X+S
	c7JpZ3HL8oeLyZGqV7+qCNPkZOl+lJOItCeVvmSC+gKVxiMJiEEftfishhNuxthkhNchImHRfIxh/
	7MOEbIOCb2j2q5Y6wO0d8qsYJXcBwwV+MT4h04jugwreyhQYa5abIqMGxiMq5XBhb2+8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubusO-0002oZ-Dk;
	Wed, 16 Jul 2025 05:40:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hsiangkao@linux.alibaba.com>) id 1ubusM-0002oS-MF
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Jul 2025 05:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/qADFoeOXBnAEHP6o81g96cI4IF1HJRJHWKwBGouJpA=; b=MDMrQQLcuiMYUEMstsm+ZFepXs
 ec/L3NdDuMPsADu5nyAJYKGdoRPXgoUurvg3Tv/w74RgGzbeX+3v04KAqNfzgi0NqhDnegKnN1Gyw
 2Z5LWR/OsGLunNL7EkrRF3fABxUWfH41/GmHaO/q5u+A01KERUi4wXtnBOZdZ0wuZRJc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/qADFoeOXBnAEHP6o81g96cI4IF1HJRJHWKwBGouJpA=; b=JQVd3+VkgW4PMr4WdjGEYR518p
 gB+qYlDLXQZaFl6Bo6Z0WUTwGIY5fg4BO0fd3MdZ0UDCaAmoPf/UJka4K/XxE9cwO+wMxFVAOYqBv
 329VsVdzuWHi0ByNmSbtgJXlyjTkqmvjQnApaqxv5gBvTTZw1W2BajcFD7ODG8LluWy8=;
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ubusL-0001dY-Gn for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Jul 2025 05:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1752644405; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=/qADFoeOXBnAEHP6o81g96cI4IF1HJRJHWKwBGouJpA=;
 b=Is2F2R2TVIHpaXiqckxA0G7pwJoZRpcBhEoGeaeUXGMbLZJmHIOFWsoUpReBEGGIiMqeev+B/q4zczBpys7s8EDbD5+85YDD0B08WE/GOa3tZHm6ZhEXzi8o/V8rqyl1Jr/x2iZ6oJRsmi7IclbuCmYXkqoBBbUexME+HL84pW8=
Received: from 30.221.131.131(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0Wj2mLXU_1752644403 cluster:ay36) by smtp.aliyun-inc.com;
 Wed, 16 Jul 2025 13:40:04 +0800
Message-ID: <e143f730-6ae7-491e-985e-cc021411edd8@linux.alibaba.com>
Date: Wed, 16 Jul 2025 13:40:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qu Wenruo <wqu@suse.com>, Matthew Wilcox <willy@infradead.org>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>, Gao Xiang <xiang@kernel.org>,
 Chao Yu <chao@kernel.org>, linux-erofs@lists.ozlabs.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, David Howells <dhowells@redhat.com>,
 netfs@lists.linux.dev, Paulo Alcantara <pc@manguebit.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, Steve French <sfrench@samba.org>,
 linux-cifs@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <2806a1f3-3861-49df-afd4-f7ac0beae43c@suse.com>
 <eeee0704-9e76-4152-bb8e-b5a0e096ec18@linux.alibaba.com>
 <b43fe06d-204b-4f47-a7ff-0c405365bc48@suse.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <b43fe06d-204b-4f47-a7ff-0c405365bc48@suse.com>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2025/7/16 12:54, Qu Wenruo wrote: > > > 在 2025/7/16
   10:46, Gao Xiang 写道: >> ... >> >>> >>>> >>>> There's some discrepancy
   between filesystems whether you need scratch >>>> space for decompres [...]
    
 
 Content analysis details:   (-7.7 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM welcome-list
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay lines
X-Headers-End: 1ubusL-0001dY-Gn
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

CgpPbiAyMDI1LzcvMTYgMTI6NTQsIFF1IFdlbnJ1byB3cm90ZToKPiAKPiAKPiDlnKggMjAyNS83
LzE2IDEwOjQ2LCBHYW8gWGlhbmcg5YaZ6YGTOgo+PiAuLi4KPj4KPj4+Cj4+Pj4KPj4+PiBUaGVy
ZSdzIHNvbWUgZGlzY3JlcGFuY3kgYmV0d2VlbiBmaWxlc3lzdGVtcyB3aGV0aGVyIHlvdSBuZWVk
IHNjcmF0Y2gKPj4+PiBzcGFjZSBmb3IgZGVjb21wcmVzc2lvbi7CoCBTb21lIGZpbGVzeXN0ZW1z
IHJlYWQgdGhlIGNvbXByZXNzZWQgZGF0YSBpbnRvCj4+Pj4gdGhlIHBhZ2VjYWNoZSBhbmQgZGVj
b21wcmVzcyBpbi1wbGFjZSwgd2hpbGUgb3RoZXIgZmlsZXN5c3RlbXMgcmVhZCB0aGUKPj4+PiBj
b21wcmVzc2VkIGRhdGEgaW50byBzY3JhdGNoIHBhZ2VzIGFuZCBkZWNvbXByZXNzIGludG8gdGhl
IHBhZ2UgY2FjaGUuCj4+Pgo+Pj4gQnRyZnMgZ29lcyB0aGUgc2NyYXRjaCBwYWdlcyB3YXkuIERl
Y29tcHJlc3Npb24gaW4tcGxhY2UgbG9va3MgYSBsaXR0bGUgdHJpY2t5IHRvIG1lLiBFLmcuIHdo
YXQgaWYgdGhlcmUgaXMgb25seSBvbmUgY29tcHJlc3NlZCBwYWdlLCBhbmQgaXQgZGVjb21wcmVz
c2VkIHRvIDQgcGFnZXMuCj4+Cj4+IERlY29tcHJlc3Npb24gaW4tcGxhY2UgbWFpbmx5IG9wdGlt
aXplcyBmdWxsIGRlY29tcHJlc3Npb24gKHNvIHRoYXQgQ1BVCj4+IGNhY2hlIGxpbmUgd29uJ3Qg
YmUgcG9sbHV0ZWQgYnkgdGVtcG9yYXJ5IGJ1ZmZlcnMgZWl0aGVyKSwgaW4gZmFjdCwKPj4gRVJP
RlMgc3VwcG9ydHMgdGhlIGh5YmlyZCB3YXkuCj4+Cj4+Pgo+Pj4gV29uJ3QgdGhlIHBsYWludGV4
dCBvdmVyLXdyaXRlIHRoZSBjb21wcmVzc2VkIGRhdGEgaGFsZndheT8KPj4KPj4gUGVyc29uYWxs
eSBJJ20gdmVyeSBmYW1pbGlhciB3aXRoIExaNCwgTFpNQSwgYW5kIERFRkxBVEUKPj4gYWxnb3Jp
dGhtIGludGVybmFscywgYW5kIEkgYWxzbyBoYXZlIGV4cGVyaWVuY2UgdG8gYnVpbGQgTFpNQSwK
Pj4gREVGTEFURSBjb21wcmVzc29ycy4KPj4KPj4gSXQncyB0b3RhbGx5IHdvcmthYmxlIGZvciBM
WjQsIGluIHNob3J0IGl0IHdpbGwgcmVhZCB0aGUgY29tcHJlc3NlZAo+PiBkYXRhIGF0IHRoZSBl
bmQgb2YgdGhlIGRlY29tcHJlc3NlZCBidWZmZXJzLCBhbmQgdGhlIHByb3BlciBtYXJnaW4KPj4g
Y2FuIG1ha2UgdGhpcyBhbG1vc3QgYWx3YXlzIHN1Y2NlZWQuCj4gCj4gSSBndWVzcyB0aGF0J3Mg
d2h5IGJ0cmZzIGNhbiBub3QgZ28gdGhhdCB3YXkuCj4gCj4gRHVlIHRvIGRhdGEgQ09XLCB3ZSdy
ZSB0b3RhbGx5IHBvc3NpYmxlIHRvIGhpdCBhIGNhc2UgdGhhdCB3ZSBvbmx5IHdhbnQgdG8gcmVh
ZCBvdXQgb25lIHNpbmdsZSBwbGFpbnRleHQgYmxvY2sgZnJvbSBhIGNvbXByZXNzZWQgZGF0YSBl
eHRlbnQgKHRoZSBjb21wcmVzc2VkIHNpemUgY2FuIGV2ZW4gYmUgbGFyZ2VyIHRoYW4gb25lIGJs
b2NrKS4KPiAKPiBJbiB0aGF0IGNhc2Ugc3VjaCBpbi1wbGFjZSBkZWNvbXByZXNzaW9uIHdpbGwg
ZGVmaW5pdGVseSBub3Qgd29yay4KCk9rLCBJIHRoaW5rIGl0J3MgbWFpbmx5IGR1ZSB0byBidHJm
cyBjb21wcmVzc2lvbiBkZXNpZ24uICBBbm90aGVyIHBvaW50CmlzIHRoYXQgZGVjb21wcmVzc2lv
biBpbnBsYWNlIGNhbiBhbHNvIGJlIHVzZWQgZm9yIG11bHRpLXNob3QgaW50ZXJmYWNlcwooYXMg
eW91IHNhaWQsICJzd2FwcGluZyBpbnB1dC8gb3V0cHV0IGJ1ZmZlciB3aGVuIG9uZSBvZiB0aGVt
IGlzIGZ1bGwiKQpsaWtlIGRlZmxhdGUsIGx6bWEgYW5kIHpzdGQuIEJlY2F1c2UgeW91IGNhbiBr
bm93IHdoZW4gdGhlIGRlY29tcHJlc3NlZApidWZmZXJzIGFuZCBjb21wcmVzc2VkIGJ1ZmZlcnMg
YXJlIG92ZXJsYXBwZWQgc2luY2UgQVBJcyBhcmUgbXVsdGktc2hvdCwKYW5kIG9ubHkgY29weSB0
aGUgb3ZlcmxhcHBlZCBjb21wcmVzc2VkIGRhdGEgdG8gc29tZSBhZGRpdGlvbmFsIHRlbXByYXJ5
CmJ1ZmZlcnMgKGFuZCB0aGV5IGNhbiBiZSBzaGFyZWQgYW1vbmcgbXVsdGlwbGUgY29tcHJlc3Nl
ZCBleHRlbnRzKS4KCkl0IGhhcyBsZXNzIG92ZXJoZWFkIHRoYW4gYWxsb2NhdGluZyB0ZW1wb3Jh
cnkgYnVmZmVycyB0byBrZWVwIGNvbXByZXNzZWQKZGF0YSBkdXJpbmcgdGhlIHdob2xlIEkvTyBw
cm9jZXNzIChhZ2FpbiwgYmVjYXVzZSBpdCBqdXN0IHVzZXMgdmVyeSBzbWFsbApudW1iZXIgYnVm
ZmVycyBkdXJpbmcgZGVjb21wcmVzc2lvbiBwcm9jZXNzKSwgZXNwZWNpYWxseSBmb3Igc2xvdyAo
ZXZlbgpuZXR3b3JrKSBzdG9yYWdlIGRldmljZXMuCgpJIGRvIHVuZGVyc3RhbmQgQnRyZnMgbWF5
IG5vdCBjb25zaWRlciB0aGlzIGJlY2F1c2Ugb2YgZGlmZmVyZW50IHRhcmdldAp1c2VycywgYnV0
IG9uZSBvZiBFUk9GUyBtYWluIHVzZSBjYXNlcyBpcyBsb3cgb3ZlcmhlYWQgZGVjb21wcmVzc2lv
bgp1bmRlciB0aGUgbWVtb3J5IHByZXNzdXJlIChtYXliZSArIGNoZWFwIHN0b3JhZ2UpLCBMWjQg
KyBpbnBsYWNlCmRlY29tcHJlc3Npb24gaXMgdXNlZnVsLgoKQW55d2F5LCBJJ20gbm90IGFkdm9j
YXRpbmcgaW5wbGFjZSBkZWNvbXByZXNzaW9uIGluIGFueSBjYXNlLiAgSSB0aGluawp1bmxpa2Ug
cGxhaW4gdGV4dCwgZW5jb2RlZCBkYXRhIGhhcyB2YXJpb3VzIGFwcHJvYWNoZXMgdG8gb3JnYW5p
emUKb24gZGlzayBhbmQgdXRpbGl6ZSBwYWdlIGNhY2hlLiAgRHVlIHRvIGRpZmZlcmVudCBvbi1k
aXNrIGRlc2lnbiBhbmQKdGFyZ2V0IHVzZXJzLCB0aGVyZSB3aWxsIGJlIGRpZmZlcmVudCB1c2Fn
ZSBtb2RlLgoKQXMgZm9yIEVST0ZTLCB3ZSBhbHJlYWR5IG5hdGl2ZWx5IHN1cHBvcnRzIGNvbXBy
ZXNzZWQgbGFyZ2UgZm9saW9zCnNpbmNlIDYuMTEsIGFuZCBvcmRlci0wIGZvbGlvIGlzIGFsd2F5
cyBvdXIgdXNlIGNhc2VzLCBzbyBJIGRvbid0CnRoaW5rIHRoaXMgd2lsbCBnaXZlIGV4dHJhIGJl
bmVmaXRzIHRvIHVzZXJzLgoKPiAKPiBbLi4uXQo+IAo+Pj4gQWxsIHRoZSBkZWNvbXByZXNzaW9u
L2NvbXByZXNzaW9uIHJvdXRpbmVzIGFsbCBzdXBwb3J0IHN3YXBwaW5nIGlucHV0LyBvdXRwdXQg
YnVmZmVyIHdoZW4gb25lIG9mIHRoZW0gaXMgZnVsbC4KPj4+IFNvIGttYXBfbG9jYWwoKSBpcyBj
b21wbGV0ZWx5IGZlYXNpYmxlLgo+Pgo+PiBJIHRoaW5rIG9uZSBvZiB0aGUgYnRyZnMgc3VwcG9y
dGVkIGFsZ29yaXRobSBMWk8gaXMgbm90LAo+IAo+IEl0IGlzLCB0aGUgdHJpY2t5IHBhcnQgaXMg
YnRyZnMgaXMgaW1wbGVtZW50aW5nIGl0cyBvd24gVExWIHN0cnVjdHVyZSBmb3IgTFpPIGNvbXBy
ZXNzaW9uLgo+IAo+IEFuZCBidHJmcyBkb2VzIGV4dHJhIHBhZGRpbmcgdG8gZW5zdXJlIG5vIFRM
ViAoY29tcHJlc3NlZCBkYXRhICsgaGVhZGVyKSBzdHJ1Y3R1cmUgd2lsbCBjcm9zcyBibG9jayBi
b3VuZGFyeS4KPiAKPiBTbyBidHJmcyBMWk8gY29tcHJlc3Npb24gaXMgc3RpbGwgYWJsZSB0byBz
d2FwIG91dCBpbnB1dC9vdXRwdXQgaGFsZndheSwgbW9zdGx5IGR1ZSB0byB0aGUgYnRyZnMnIHNw
ZWNpZmljIGRlc2lnbi4KCk9rLCBpdCBzZWVtcyBtdWNoIGxpa2UgYSBidHJmcy1zcGVjaWZpYyBk
ZXNpZ24sIGJlY2F1c2UgaXQncyBtdWNoCmxpa2UgcGVyLWJsb2NrIGNvbXByZXNzaW9uIGZvciBM
Wk8gaW5zdGVhZCwgYW5kIGl0IHdpbGwgaW5jcmVhc2UKdGhlIGNvbXByZXNzZWQgc2l6ZSwgSSBr
bm93IGJ0cmZzIG1heSBub3QgY2FyZSwgYnV0IGl0J3Mgbm90IHRoZQpFUk9GUyBjYXNlIGFueXdh
eS4KClRoYW5rcywKR2FvIFhpYW5nCgo+IAo+IFRoYW5rcywKPiBRdQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
