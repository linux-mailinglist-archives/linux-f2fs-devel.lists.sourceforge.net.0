Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD3BB0BB47
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Jul 2025 05:15:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLORLoht4gsYtJN+6LcVzDJATJKv2lKu1vsGwlvzduc=; b=C7ZHL6a3kHHF+qfbvW1VBkEM9u
	XcF6q7HjMBfOtC3W+Ywl9E16SlzkbjSmnmMaOp+RLR0VuQ89VPF5BCYQNO8qiqE4/MJ18r1z0VOkn
	MQsfMPO1K1WlzASvw5VVvAl8TMA0hZNDr8kQcjia7I8W5+AaqyZxhqePJ70nmEt0HWKc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1udgzU-0007HG-RO;
	Mon, 21 Jul 2025 03:15:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hsiangkao@linux.alibaba.com>) id 1udgys-0007Gh-7T
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 03:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lCr7ru8zjyenyzhIwOzkZiA0apFYT5PO1pQKlR1f6Gw=; b=cRlyTzcfhn/YbmTYG+N7wMINuS
 ANJ5FWoH2dFKP7viEtUQfapHhJWCPOkbVhwtbEonjLaoq2OM7fYhTFrXlV/MIj8WrqgW5llHWSDku
 71t+F68uND/iv+kGDcGmw0LAgfDDVohsgUbkZyxgSyr7kOcksGSy4RoKr8KbkwdI7qxk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lCr7ru8zjyenyzhIwOzkZiA0apFYT5PO1pQKlR1f6Gw=; b=citdYvrs/FRQW2u31rIWG2VndS
 /v/kL7j6NL45HTWGn2/w8BnZpisQo9ddEsUeEDaGuC2j6GxjTcjpALN5VFCddyV24I+U33WVhuWLF
 yAVNMWWVcuulH8R0lg02kSgKY8wXfwrV4epl8OfdMPXCi0GLzglb2tzARnBDGb745dYA=;
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1udgyr-00007t-AR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 03:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1753067648; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=lCr7ru8zjyenyzhIwOzkZiA0apFYT5PO1pQKlR1f6Gw=;
 b=fziExLzuV0rwx+GNWyk/aJVvLiw1lgfmtG0LVBGZ/fXM0/0zWxg0EtREi2ma38nXPryOAVmk72zNme1RDevzg4cZAmIbEFy4vq17BzYaoHwhzcXIYN+J2mYubwxO/v6uCpPangEKOAXY+UpHDPG/3hV4FABx7exXkQlz7jwfW3Y=
Received: from 30.221.132.193(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0WjIdN4u_1753067645 cluster:ay36) by smtp.aliyun-inc.com;
 Mon, 21 Jul 2025 11:14:06 +0800
Message-ID: <7ea73f49-df4b-4f88-8b23-c917b4a9bd8a@linux.alibaba.com>
Date: Mon, 21 Jul 2025 11:14:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Barry Song <21cnbao@gmail.com>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
 <b61c4b7f-4bb1-4551-91ba-a0e0ffd19e75@linux.alibaba.com>
 <CAGsJ_4xJjwsvMpeBV-QZFoSznqhiNSFtJu9k6da_T-T-a6VwNw@mail.gmail.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <CAGsJ_4xJjwsvMpeBV-QZFoSznqhiNSFtJu9k6da_T-T-a6VwNw@mail.gmail.com>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Barry, On 2025/7/21 09:02, Barry Song wrote: > On Wed,
 Jul 16, 2025 at 8:28 AM Gao Xiang <hsiangkao@linux.alibaba.com> wrote: >>
 ... Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1udgyr-00007t-AR
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
 Qu Wenruo <quwenruo.btrfs@gmx.com>, linux-cifs@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Matthew Wilcox <willy@infradead.org>,
 Gao Xiang <xiang@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Phillip Lougher <phillip@squashfs.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Howells <dhowells@redhat.com>,
 Nicolas Pitre <nico@fluxnic.net>, David Woodhouse <dwmw2@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 Hailong Liu <hailong.liu@oppo.com>, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQmFycnksCgpPbiAyMDI1LzcvMjEgMDk6MDIsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gT24gV2Vk
LCBKdWwgMTYsIDIwMjUgYXQgODoyOOKAr0FNIEdhbyBYaWFuZyA8aHNpYW5na2FvQGxpbnV4LmFs
aWJhYmEuY29tPiB3cm90ZToKPj4KCi4uLgoKPj4KPj4gLi4uIGhpZ2gtb3JkZXIgZm9saW9zIGNh
biBjYXVzZSBzaWRlIGVmZmVjdHMgb24gZW1iZWRkZWQgZGV2aWNlcwo+PiBsaWtlIHJvdXRlcnMg
YW5kIElvVCBkZXZpY2VzLCB3aGljaCBzdGlsbCBoYXZlIE1pQnMgb2YgbWVtb3J5IChhbmQgSQo+
PiBiZWxpZXZlIHRoaXMgd29uJ3QgY2hhbmdlIGR1ZSB0byB0aGVpciB1c2UgY2FzZXMpIGJ1dCB0
aGV5IGFsc28gdXNlCj4+IExpbnV4IGtlcm5lbCBmb3IgcXVpdGUgbG9uZyB0aW1lLiAgSW4gc2hv
cnQsIEkgZG9uJ3QgdGhpbmsgZW5hYmxpbmcKPj4gbGFyZ2UgZm9saW9zIGZvciB0aG9zZSBkZXZp
Y2VzIGlzIHZlcnkgdXNlZnVsLCBsZXQgYWxvbmUgbGltaXRpbmcKPj4gdGhlIG1pbmltdW0gZm9s
aW8gb3JkZXIgZm9yIHRoZW0gKEl0IHdvdWxkIG1ha2UgdGhlIGZpbGVzeXN0ZW0gbm90Cj4+IHN1
aXRhYmxlIGFueSBtb3JlIGZvciB0aG9zZSB1c2Vycy4gIEF0IGxlYXN0IHRoYXQgaXMgd2hhdCBJ
IG5ldmVyCj4+IHdhbnQgdG8gZG8pLiAgQW5kIEkgYmVsaWV2ZSB0aGlzIGlzIGRpZmZlcmVudCBm
cm9tIHRoZSBjdXJyZW50IExCUwo+PiBzdXBwb3J0IHRvIG1hdGNoIGhhcmR3YXJlIGNoYXJhY3Rl
cmlzdGljcyBvciBMQlMgYXRvbWljIHdyaXRlCj4+IHJlcXVpcmVtZW50Lgo+IAo+IEdpdmVuIHRo
ZSBkaWZmaWN1bHR5IG9mIGFsbG9jYXRpbmcgbGFyZ2UgZm9saW9zLCBpdCdzIGFsd2F5cyBhIGdv
b2QKPiBpZGVhIHRvIGhhdmUgb3JkZXItMCBhcyBhIGZhbGxiYWNrLiBXaGlsZSBJIGFncmVlIHdp
dGggeW91ciBwb2ludCwKPiBJIGhhdmUgYSBzbGlnaHRseSBkaWZmZXJlbnQgcGVyc3BlY3RpdmUg
4oCUIGVuYWJsaW5nIGxhcmdlIGZvbGlvcyBmb3IKPiB0aG9zZSBkZXZpY2VzIG1pZ2h0IGJlIGJl
bmVmaWNpYWwsIGJ1dCB0aGUgbWF4aW11bSBvcmRlciBzaG91bGQKPiByZW1haW4gc21hbGwuIEkn
bSByZWZlcnJpbmcgdG8gInNtYWxsIiBsYXJnZSBmb2xpb3MuCgpZZWFoLCBhZ3JlZWQuIEhhdmlu
ZyBhIHdheSB0byBsaW1pdCB0aGUgbWF4aW11bSBvcmRlciBmb3IgdGhvc2Ugc21hbGwKZGV2aWNl
cyAocmF0aGVyIHRoYW4gZGlzYWJsaW5nIGl0IGNvbXBsZXRlbHkpIHdvdWxkIGJlIGhlbHBmdWwu
ICBBdApsZWFzdCAic21hbGwiIGxhcmdlIGZvbGlvcyBjb3VsZCBzdGlsbCBwcm92aWRlIGJlbmVm
aXRzIHdoZW4gbWVtb3J5CnByZXNzdXJlIGlzIGxpZ2h0LgoKVGhhbmtzLApHYW8gWGlhbmcKCj4g
Cj4gU3RpbGwsIGV2ZW4gd2l0aCB0aG9zZSwgYWxsb2NhdGlvbiBjYW4gYmUgZGlmZmljdWx0IOKA
lCBlc3BlY2lhbGx5Cj4gc2luY2Ugc28gbWFueSBvdGhlciBhbGxvY2F0aW9ucyAod2hpY2ggYXJl
bid0IGxhcmdlIGZvbGlvcykgY2FuIGNhdXNlCj4gZnJhZ21lbnRhdGlvbi4gU28gaGF2aW5nIG9y
ZGVyLTAgYXMgYSBmYWxsYmFjayByZW1haW5zIGltcG9ydGFudC4KPiAKPiBJdCBzZWVtcyB3ZSdy
ZSBtaXNzaW5nIGEgbWVjaGFuaXNtIHRvIGVuYWJsZSAic21hbGwiIGxhcmdlIGZvbGlvcwo+IGZv
ciBmaWxlcy4gRm9yIGFub24gbGFyZ2UgZm9saW9zLCB3ZSBkbyBoYXZlIHN5c2ZzIGtub2Jz4oCU
dGhvdWdoIHRoZXkKPiBkb27igJl0IHNlZW0gdG8gYmUgdW5pdmVyc2FsbHkgYXBwcmVjaWF0ZWQu
IDotKQo+IAo+IFRoYW5rcwo+IEJhcnJ5CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
