Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B64EB0C333
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Jul 2025 13:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hpTZF6QsWBD1GF9gTNESBQNssUEhbweVqHEdR9h4Ew=; b=LorakV/+/9A722FVpKYthVBolD
	TxdT6E8EqOELT6eL+E+e35sPAFZnptA/lRzBvpDoCbUKuxrEASmJrkJHqcACvlPeOt/YsmpuzHCbp
	HE+zBzrMllLaSmA4V2CnmmRYVzJob7UiiDrXkAUJ5aRL30/X/kOevyn1p2IApvWhAWfM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1udopm-00069q-MN;
	Mon, 21 Jul 2025 11:37:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quwenruo.btrfs@gmx.com>) id 1udopk-00069g-F8
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 11:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zBIsLLD0agXGs83w4tbKBYZqttgfplGTbcXLQzdNcrg=; b=R92/uCj6PMot0IBo/eKb15MylB
 ph2A0Br15p/zkZOQYnODswO/rLOmRWFtaZEp1ibTi+XoMlnSbTsJf04Cu7/2X2EPLRU+qr3/WPkoO
 ihSjpiT5HI8s53v7q1IwLv7p51EGWK5TIW6x6vRS82Og3bZF2jrthqYz4TOV69mv6glE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zBIsLLD0agXGs83w4tbKBYZqttgfplGTbcXLQzdNcrg=; b=fnPD2uRqfO2hafaWP62CUMDxLY
 qViuMMJkXOyCJogY6i/uOPJOoZMU9k+YGgM/wrcQSV7UD2I1M3lDfagAtW9HQPRivExKXfjSjVD0A
 5IFsELPhHF5Gt/S4dzXTTx6xS5d4ndGFwwXbstB1Lw3VmHQJ9zzUOHGaqYsNSA9Pyz0o=;
Received: from mout.gmx.net ([212.227.15.19])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1udopj-0002Yo-Oh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 11:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1753097812; x=1753702612; i=quwenruo.btrfs@gmx.com;
 bh=zBIsLLD0agXGs83w4tbKBYZqttgfplGTbcXLQzdNcrg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=G+7PDLAi1AxvmZ/TaDgO317qqRqOqAN0zAgfp7epxgqYrJfiiIF0XCpbXm5LxS/1
 wZdVeYgw3hRxCeD6bX7kQB3PKUn+OjtoyKh34v1XGhIZZaQQiUXb0RPIFcx3HoyR4
 e8XOF/1bybaGC82vrBiWQYlKxNoeOdAuFFdiJjy07qf2Qz/UPCYwq+PLQ+n/3V2wg
 Wa5aCd5eOd3ksv+PpAHHtX44RqBDQPDwPwxY++QYnBLNXkE6+4NW7KdD9LCt1z1IP
 c+0mO3x9Pu8RS23gtW6E9WFnR28pgM5fOHCv/4rHi17Ny7a/4yGIYVHILtpWm1fvD
 2+nvmrn717GJHFxL0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.229] ([159.196.52.54]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MybGh-1uoDpm0wnN-010ycz; Mon, 21
 Jul 2025 13:36:51 +0200
Message-ID: <85946346-8bfd-4164-a49d-594b4a158588@gmx.com>
Date: Mon, 21 Jul 2025 21:06:38 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jan Kara <jack@suse.cz>, Gao Xiang <hsiangkao@linux.alibaba.com>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
 <b61c4b7f-4bb1-4551-91ba-a0e0ffd19e75@linux.alibaba.com>
 <CAGsJ_4xJjwsvMpeBV-QZFoSznqhiNSFtJu9k6da_T-T-a6VwNw@mail.gmail.com>
 <7ea73f49-df4b-4f88-8b23-c917b4a9bd8a@linux.alibaba.com>
 <z2ule3ilnnpoevo5mvt3intvjtuyud7vg3pbfauon47fhr4owa@giaehpbie4a5>
Content-Language: en-US
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1YAUJEP5a
 sQAKCRDCPZHzoSX+qF+mB/9gXu9C3BV0omDZBDWevJHxpWpOwQ8DxZEbk9b9LcrQlWdhFhyn
 xi+l5lRziV9ZGyYXp7N35a9t7GQJndMCFUWYoEa+1NCuxDs6bslfrCaGEGG/+wd6oIPb85xo
 naxnQ+SQtYLUFbU77WkUPaaIU8hH2BAfn9ZSDX9lIxheQE8ZYGGmo4wYpnN7/hSXALD7+oun
 tZljjGNT1o+/B8WVZtw/YZuCuHgZeaFdhcV2jsz7+iGb+LsqzHuznrXqbyUQgQT9kn8ZYFNW
 7tf+LNxXuwedzRag4fxtR+5GVvJ41Oh/eygp8VqiMAtnFYaSlb9sjia1Mh+m+OBFeuXjgGlG
 VvQFzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1gQUJEP5a0gAK
 CRDCPZHzoSX+qHGpB/kB8A7M7KGL5qzat+jBRoLwB0Y3Zax0QWuANVdZM3eJDlKJKJ4HKzjo
 B2Pcn4JXL2apSan2uJftaMbNQbwotvabLXkE7cPpnppnBq7iovmBw++/d8zQjLQLWInQ5kNq
 Vmi36kmq8o5c0f97QVjMryHlmSlEZ2Wwc1kURAe4lsRG2dNeAd4CAqmTw0cMIrR6R/Dpt3ma
 +8oGXJOmwWuDFKNV4G2XLKcghqrtcRf2zAGNogg3KulCykHHripG3kPKsb7fYVcSQtlt5R6v
 HZStaZBzw4PcDiaAF3pPDBd+0fIKS6BlpeNRSFG94RYrt84Qw77JWDOAZsyNfEIEE0J6LSR/
In-Reply-To: <z2ule3ilnnpoevo5mvt3intvjtuyud7vg3pbfauon47fhr4owa@giaehpbie4a5>
X-Provags-ID: V03:K1:KDXt1vR1fT3Zmk9s0ZPAImsaPPiOo0tezqUWd5Kf9CdjbZbF7k4
 k3gVPpxoDBzZaxV6R+UYdLWaK1/PTnGXVRZ1s6k8AUc3RGswW9CCDD2U/eWO9Hwv8oYpkYI
 THIoD2qPA/NKqeH2x5OB4BeuIqWMGlXiYNhqMnFs75vdCpTKJCpG82FqfbLeMe6qpgbYlsV
 LdrTRCbJ1pA9hGbTaSpcQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LrWi0qhLJaY=;eltaPT9HJUWueclF2/CsWbEt+J5
 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
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/7/21 19:55, Jan Kara 写道: > On Mon 21-07-25 11:14:02,
    Gao Xiang wrote: >> Hi Barry, >> >> On 2025/7/21 09:02, Barry Song wrote:
    >>> On Wed, Jul 16, 2025 at 8:28 AM Gao Xiang wrote: [...] [...] 
 
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
                             [quwenruo.btrfs(at)gmx.com]
  0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
                             [212.227.15.19 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1udopj-0002Yo-Oh
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
From: Qu Wenruo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Paulo Alcantara <pc@manguebit.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>,
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

CgrlnKggMjAyNS83LzIxIDE5OjU1LCBKYW4gS2FyYSDlhpnpgZM6Cj4gT24gTW9uIDIxLTA3LTI1
IDExOjE0OjAyLCBHYW8gWGlhbmcgd3JvdGU6Cj4+IEhpIEJhcnJ5LAo+Pgo+PiBPbiAyMDI1Lzcv
MjEgMDk6MDIsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4+PiBPbiBXZWQsIEp1bCAxNiwgMjAyNSBhdCA4
OjI44oCvQU0gR2FvIFhpYW5nIDxoc2lhbmdrYW9AbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgpb
Li4uXQo+Pj4gR2l2ZW4gdGhlIGRpZmZpY3VsdHkgb2YgYWxsb2NhdGluZyBsYXJnZSBmb2xpb3Ms
IGl0J3MgYWx3YXlzIGEgZ29vZAo+Pj4gaWRlYSB0byBoYXZlIG9yZGVyLTAgYXMgYSBmYWxsYmFj
ay4gV2hpbGUgSSBhZ3JlZSB3aXRoIHlvdXIgcG9pbnQsCj4+PiBJIGhhdmUgYSBzbGlnaHRseSBk
aWZmZXJlbnQgcGVyc3BlY3RpdmUg4oCUIGVuYWJsaW5nIGxhcmdlIGZvbGlvcyBmb3IKPj4+IHRo
b3NlIGRldmljZXMgbWlnaHQgYmUgYmVuZWZpY2lhbCwgYnV0IHRoZSBtYXhpbXVtIG9yZGVyIHNo
b3VsZAo+Pj4gcmVtYWluIHNtYWxsLiBJJ20gcmVmZXJyaW5nIHRvICJzbWFsbCIgbGFyZ2UgZm9s
aW9zLgo+Pgo+PiBZZWFoLCBhZ3JlZWQuIEhhdmluZyBhIHdheSB0byBsaW1pdCB0aGUgbWF4aW11
bSBvcmRlciBmb3IgdGhvc2Ugc21hbGwKPj4gZGV2aWNlcyAocmF0aGVyIHRoYW4gZGlzYWJsaW5n
IGl0IGNvbXBsZXRlbHkpIHdvdWxkIGJlIGhlbHBmdWwuICBBdAo+PiBsZWFzdCAic21hbGwiIGxh
cmdlIGZvbGlvcyBjb3VsZCBzdGlsbCBwcm92aWRlIGJlbmVmaXRzIHdoZW4gbWVtb3J5Cj4+IHBy
ZXNzdXJlIGlzIGxpZ2h0Lgo+IAo+IFdlbGwsIGluIHRoZSBwYWdlIGNhY2hlIHlvdSBjYW4gdHVu
ZSBub3Qgb25seSB0aGUgbWluaW11bSBidXQgYWxzbyB0aGUKPiBtYXhpbXVtIG9yZGVyIG9mIGEg
Zm9saW8gYmVpbmcgYWxsb2NhdGVkIGZvciBlYWNoIGlub2RlLiBCdHJmcyBhbmQgZXh0NAo+IGFs
cmVhZHkgdXNlIHRoaXMgZnVuY3Rpb25hbGl0eS4gU28gaW4gcHJpbmNpcGxlIHRoZSBmdW5jdGlv
bmFsaXR5IGlzIHRoZXJlLAo+IGl0IGlzICJqdXN0IiBhIHF1ZXN0aW9uIG9mIHByb3BlciB1c2Vy
IGludGVyZmFjZXMgb3IgYXV0b21hdGljIGxvZ2ljIHRvCj4gdHVuZSB0aGlzIGxpbWl0Lgo+IAo+
IAkJCQkJCQkJSG9uemEKCkFuZCBlbmFibGluZyBsYXJnZSBmb2xpb3MgZG9lc24ndCBtZWFuIGFs
bCBmcyBvcGVyYXRpb25zIHdpbGwgZ3JhYiBhbiAKdW5uZWNlc3NhcmlseSBsYXJnZSBmb2xpby4K
CkZvciBidWZmZXJlZCB3cml0ZSwgYWxsIHRob3NlIGZpbGVzeXN0ZW0gd2lsbCBvbmx5IHRyeSB0
byBnZXQgZm9saW9zIGFzIApsYXJnZSBhcyBuZWNlc3NhcnksIG5vdCBvdmVybHkgbGFyZ2UuCgpU
aGlzIG1lYW5zIGlmIHRoZSB1c2VyIHNwYWNlIHByb2dyYW0gaXMgYWx3YXlzIGRvaW5nIGJ1ZmZl
cmVkIElPIGluIGEgCnBvd2VyLW9mLXR3byB1bml0IChhbmQgYWxpZ25lZCBvZmZzZXQgb2YgY291
cnNlKSwgdGhlIGZvbGlvIHNpemUgd2lsbCAKbWF0Y2ggdGhlIGJ1ZmZlciBzaXplIHBlcmZlY3Rs
eSAoaWYgd2UgaGF2ZSBlbm91Z2ggbWVtb3J5KS4KClNvIGZvciBwcm9wZXJseSBhbGlnbmVkIGJ1
ZmZlcmVkIHdyaXRlcywgbGFyZ2UgZm9saW9zIHdvbid0IHJlYWxseSBjYXVzZSAKICB1bm5lY2Vz
c2FyaWx5IGxhcmdlIGZvbGlvcywgbWVhbndoaWxlIGJyaW5ncyBhbGwgdGhlIGJlbmVmaXRzLgoK
CkFsdGhvdWdoIEknbSBub3QgZmFtaWxpYXIgZW5vdWdoIHdpdGggZmlsZW1hcCB0byBjb21tZW50
IG9uIGZvbGlvIHJlYWQgCmFuZCByZWFkYWhlYWQuLi4KClRoYW5rcywKUXUKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
