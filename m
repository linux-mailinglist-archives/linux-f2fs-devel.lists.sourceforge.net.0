Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8D8AEEF37
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Jul 2025 08:49:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ky2O84u/jQN9eRTC0uWSz2/uGpQXyBL8bYUJ+SMOaM=; b=FOKI4O/Xj+aIgTPCD7Q18ylT2c
	qbdFU7VIjhjR7/RWPExZn81XTOvM/mHf3//QBjJFAd4hTmLVBS5PyCAAj6NCEzC9ysgLHvKOfF2W7
	/qWjECIhokyFTF8G3p/ALwovoxypGBuECLbpNjZ7rQaXeXySP8QLWe+uSOPPnzJ7DeM0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWUoF-00011d-M8;
	Tue, 01 Jul 2025 06:49:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quwenruo.btrfs@gmx.com>) id 1uWUoD-00011I-Lh
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 06:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cJjIAj6ubRAM7ciGlGMfKU676Bp5+7L6s2UhrUMnQUo=; b=SIXeDgRN/V/u58HYGsV1WJb8OE
 fejR7ZM8Z9HlcwgqmkQInzmY/cj5sQZfW1mr8fwtt4qRXKlrgrPbTT7K+bZhcTa5iPNAtFvox9LWW
 70Jk29Ifvwirq1IC7zXquCLgiGFnW/4EPT+0iVgJhyBnWTsW4dt9me6AqdvNn/pxcCnU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cJjIAj6ubRAM7ciGlGMfKU676Bp5+7L6s2UhrUMnQUo=; b=SjhEULuK9gD+39IloHm2M6Wd2t
 jQC9nVKh8kv1KTIG8cAMei43vAmPYPNvJYJcHTOztQIUAhGQtaT0z6Gj3FT6d9KNgK24DB+vjZcIZ
 ibYv5isWHqtB/+bdrGzdroyk/A2q+9pRtIqaV+SI3/HnBGILw67Ba1qI9GnZvpTx9m/s=;
Received: from mout.gmx.net ([212.227.17.22])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWUoD-0005AZ-0o for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 06:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1751352570; x=1751957370; i=quwenruo.btrfs@gmx.com;
 bh=cJjIAj6ubRAM7ciGlGMfKU676Bp5+7L6s2UhrUMnQUo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=SkDO0+O/6UNjvkh7vxviF/Rf/U+64RcG1a7JTgkGsN3KkG/K3lPaVARMabyUFPuD
 RwvDnt3GQ+mgeqJh/kI+0qiXJhxSVw0mWg9z2WM04dQZuDNykPB4whokiqyJNyqzA
 OJQna7bJ9I+AGz5+0rnoxMJWhVofmM2pe/6FfxMGC0XIsa+Rg7e56GMneH9fTKW9B
 0zKj2eEcaS4CqpUlB5OUmcaeMNvzSkd2mStHpLeIbqHGnCVOxMmEsMwC29xlincS/
 4z0At77oiGxMHjy9HWQhdwNnhp/UUhdZQDrRM1rfwV2U8qJKih35JB70oh/ZGnUKY
 VXBNag198OwQS8NksQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.229] ([159.196.52.54]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MD9T7-1uNS2h0pxB-00370P; Tue, 01
 Jul 2025 08:35:11 +0200
Message-ID: <baec02a0-e2fb-4801-b2ad-f602fc4d1cfc@gmx.com>
Date: Tue, 1 Jul 2025 16:05:03 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@infradead.org>, Qu Wenruo <wqu@suse.com>
References: <cover.1751347436.git.wqu@suse.com>
 <6164b8c708b6606c640c066fbc42f8ca9838c24b.1751347436.git.wqu@suse.com>
 <aGN8zsyYEArKr0DV@infradead.org>
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
In-Reply-To: <aGN8zsyYEArKr0DV@infradead.org>
X-Provags-ID: V03:K1:S7b/wFGvHmGysao1RvJ5BvTVYCoxhFsUUgP9+ZmDouj5riSCLuB
 HJLJ+sFRwgRLl/xwKk4ZHo/mA6h4P5ZzuP9SwvIpKL12iJJBN6f1yxxxvPLV9CbZ1SOblCN
 tpLhTIxkdJYro/whp5G0/k9o/pt/4mREtY6OwrbFY/k54rLHQJaHn0D1p/0UgApA1UqKUuu
 pKVOQfnKQFcoFkw/TBgVQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IdcjaHUZSb0=;Yo+Gve+XBQU9m5EWQJKF3gnWAyn
 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
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/7/1 15:44, Christoph Hellwig 写道: > On Tue, Jul
    01, 2025 at 03:02:34PM +0930, Qu Wenruo wrote: >> To allow those multi-device
    filesystems to be integrated to use >> fs_holder_ops: >> >> - [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [quwenruo.btrfs(at)gmx.com]
  0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
                             [212.227.17.22 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uWUoD-0005AZ-0o
Subject: Re: [f2fs-dev] [PATCH v2 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
Cc: brauner@kernel.org, ntfs3@lists.linux.dev, jack@suse.cz,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyNS83LzEgMTU6NDQsIENocmlzdG9waCBIZWxsd2lnIOWGmemBkzoKPiBPbiBUdWUs
IEp1bCAwMSwgMjAyNSBhdCAwMzowMjozNFBNICswOTMwLCBRdSBXZW5ydW8gd3JvdGU6Cj4+IFRv
IGFsbG93IHRob3NlIG11bHRpLWRldmljZSBmaWxlc3lzdGVtcyB0byBiZSBpbnRlZ3JhdGVkIHRv
IHVzZQo+PiBmc19ob2xkZXJfb3BzOgo+Pgo+PiAtIFJlbmFtZSBzaHV0ZG93bigpIGNhbGwgYmFj
ayB0byByZW1vdmVfYmRldigpCj4+ICAgIFRvIGJldHRlciBkZXNjcmliZSB3aGVuIHRoZSBjYWxs
IGJhY2sgaXMgY2FsbGVkLgo+IAo+IFdoYXQgaXMgcmVuYW1lZCBiYWNrIGhlcmU/CgpSZW5hbWUg
dGhlIG9sZCBzaHV0ZG93biB0byByZW1vdmVfYmRldigpLgoKPiAKPj4gLXN0YXRpYyB2b2lkIGV4
ZmF0X3NodXRkb3duKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IpCj4+ICtzdGF0aWMgdm9pZCBleGZh
dF9zaHV0ZG93bihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBzdHJ1Y3QgYmxvY2tfZGV2aWNlICpi
ZGV2KQo+PiAgIHsKPj4gICAJZXhmYXRfZm9yY2Vfc2h1dGRvd24oc2IsIEVYRkFUX0dPSU5HX0RP
V05fTk9TWU5DKTsKPj4gICB9Cj4+IEBAIC0yMDIsNyArMjAyLDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBzdXBlcl9vcGVyYXRpb25zIGV4ZmF0X3NvcHMgPSB7Cj4+ICAgCS5wdXRfc3VwZXIJPSBl
eGZhdF9wdXRfc3VwZXIsCj4+ICAgCS5zdGF0ZnMJCT0gZXhmYXRfc3RhdGZzLAo+PiAgIAkuc2hv
d19vcHRpb25zCT0gZXhmYXRfc2hvd19vcHRpb25zLAo+PiAtCS5zaHV0ZG93bgk9IGV4ZmF0X3No
dXRkb3duLAo+PiArCS5yZW1vdmVfYmRldgk9IGV4ZmF0X3NodXRkb3duLAo+IAo+IFBsZWFzZSBh
bHNvIHJlbmFtZSB0aGUgZnVuY3Rpb24gc28gdGhhdCB0aGV5IG1hdGNoIHRoZSBtZXRob2QgbmFt
ZS4KCkkgcHJlZmVyIG5vdCwgYW5kIGl0IGlzIGludGVudGlvbmFsbHkgbGVmdCBhcyBpcy4KClRo
aXMgZ2l2ZSB1cyBhIHZlcnkgY2xlYXIgdmlldyB3aGF0IGEgZnMgaXMgZXhwZWN0ZWQgdG8gZG8u
CgpJZiBhIGZzIGNhbiBvbmx5IHNodXRkb3duIHdoZW4gbG9zaW5nIGFueSBkZXZpY2UsIGEgcmVh
ZCB3b24ndCBuZWVkIHRvIApkaWcgaW50byB0aGUgZGV0YWlscywganVzdCBsb29raW5nIGF0IHRo
YXQgbGluZSB3aWxsIHRlbGwgdXMgd2hhdCBpcyB0aGUgCmJlaGF2aW9yLgoKVGhhbmtzLApRdQoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
