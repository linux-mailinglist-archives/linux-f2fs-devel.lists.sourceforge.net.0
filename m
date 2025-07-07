Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F39AFBE92
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 01:23:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0NDc6n0Q9ShPJVv9EolZxSOQi9cEF36fbOj0Tb7KWg=; b=iD7TMnDNOvaCeWuv2cG2JYimmZ
	J5Hw7+8HiDgoWM7ahEc1/K+bHN70Ng+pCxpGXopcN714GMTM18o6l0PFKs6U20/s6vF6Sc9nOoN7L
	v707Jr/tkTcQJ91sZEjLIMtzUD6PvRGLrXIIDu14rS6Igj1gaHmpJxnxvjXzLy2L4gU0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uYvB5-0000V2-Ht;
	Mon, 07 Jul 2025 23:23:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quwenruo.btrfs@gmx.com>) id 1uYvB4-0000Uv-7r
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Jul 2025 23:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oDGxAytI/hZJOsHwe4zDzBvCFX7I/dRtdpEmiKudrRE=; b=DEjnUOgF42I/IlslsonM9L6Nas
 8mLt7aZTxEKZkMZVf5HtvbvTLPBd5at9IRlAef+bdvVsxKxGw9bY2fN0Fq3LUNkl5rPU3preGbead
 fER7tdvmhnmyOVmxP5P6HlOq51+GQgG9N0FY5245qe4LmVsyIYdVgdCrmj9aqd77r9Rw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oDGxAytI/hZJOsHwe4zDzBvCFX7I/dRtdpEmiKudrRE=; b=FIA1qR7OTSb30pTHot9VvNk3hb
 6xddZWSwMUv4/j27AUQ52arLXNdQCMxbr25ULXxpNgcWENIdcXwCCD3mPoWdvoXh5erGkrDmsEL5K
 0QBTaPo3F0t+oWaijT0raRWnJn3XBUxD+UltlV04kI3W3/xTz4honZaQrn1IMnNKFO3A=;
Received: from mout.gmx.net ([212.227.17.22])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uYvB3-0000zl-A5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Jul 2025 23:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1751930573; x=1752535373; i=quwenruo.btrfs@gmx.com;
 bh=oDGxAytI/hZJOsHwe4zDzBvCFX7I/dRtdpEmiKudrRE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Zjv8hKUPvtZLYQ/Db4xUW3RyEjTpXnamacdEVh6Rnw9sLCRtYcnHI36Dvdrs6RdL
 Cmqj6k4ihMDxox4yLKPVZcwLDbaTKg5EcYNN8Z7vluCz/+vV6h7q6glSoP4BjwFGN
 iCNCvtn97eFyU7DQr1vW0yNITj1/hV9lmVqrclk2b68zGtIWwsgZjSL8W04PIfP2+
 9jNFGSv0OC3ryOk+HPwgHpNr1XHXHu0xapcTUsL4UEIzHUoXNVIkMHCcbYUAZyeF/
 HYfJ4QZ4EEgwi/ZWEseP3TCbrcY0c+oB5COpC6xKnK25YPlPokunXoemznHj7tZ5I
 lRe1GAz7I8LGnOEqSA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.229] ([159.196.52.54]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MWzjt-1uAxJV1a81-00Pnh5; Tue, 08
 Jul 2025 01:22:52 +0200
Message-ID: <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
Date: Tue, 8 Jul 2025 08:52:47 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dave Chinner <david@fromorbit.com>, Qu Wenruo <wqu@suse.com>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
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
In-Reply-To: <aGxSHKeyldrR1Q0T@dread.disaster.area>
X-Provags-ID: V03:K1:Fh9STDID+y5LPw9/Fq2kSOxplS0SXa5VtGqgX/sxr1gsWYqYXA6
 1rRl/yaLLYb6KJ9q0c+H5/KrcT94wO8dtavXEpF09yKDKEx0aNXu7eKzbpJAnXG6echlBxK
 8Ienl9KdjETF35uTAwTfrMYVCOvaAJNRtB1JZs8RXDHmVaL63WxLIhFK7l5DKfXnpP5Jc0L
 UlV+XmBBOycuGBFPFkvFw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vxzf/0dc4gs=;cEtS4m0APqpDTI0YVG7hCD8EKfv
 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
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/7/8 08:32, Dave Chinner 写道: > On Fri, Jul 04,
    2025 at 10:12:29AM +0930, Qu Wenruo wrote: >> Currently all the filesystems
    implementing the >> super_opearations::shutdown() callback can no [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [quwenruo.btrfs(at)gmx.com]
  0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
                             [212.227.17.22 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uYvB3-0000zl-A5
Subject: Re: [f2fs-dev] [PATCH v4 1/6] fs: enhance and rename shutdown()
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

CgrlnKggMjAyNS83LzggMDg6MzIsIERhdmUgQ2hpbm5lciDlhpnpgZM6Cj4gT24gRnJpLCBKdWwg
MDQsIDIwMjUgYXQgMTA6MTI6MjlBTSArMDkzMCwgUXUgV2VucnVvIHdyb3RlOgo+PiBDdXJyZW50
bHkgYWxsIHRoZSBmaWxlc3lzdGVtcyBpbXBsZW1lbnRpbmcgdGhlCj4+IHN1cGVyX29wZWFyYXRp
b25zOjpzaHV0ZG93bigpIGNhbGxiYWNrIGNhbiBub3QgYWZmb3JkIGxvc2luZyBhIGRldmljZS4K
Pj4KPj4gVGh1cyBmc19iZGV2X21hcmtfZGVhZCgpIHdpbGwganVzdCBjYWxsIHRoZSBzaHV0ZG93
bigpIGNhbGxiYWNrIGZvciB0aGUKPj4gaW52b2x2ZWQgZmlsZXN5c3RlbS4KPj4KPj4gQnV0IGl0
IHdpbGwgbm8gbG9uZ2VyIGJlIHRoZSBjYXNlLCB3aXRoIG11bHRpLWRldmljZSBmaWxlc3lzdGVt
cyBsaWtlCj4+IGJ0cmZzIGFuZCBiY2FjaGVmcyB0aGUgZmlsZXN5c3RlbSBjYW4gaGFuZGxlIGNl
cnRhaW4gZGV2aWNlIGxvc3Mgd2l0aG91dAo+PiBzaHV0dGluZyBkb3duIHRoZSB3aG9sZSBmaWxl
c3lzdGVtLgo+Pgo+PiBUbyBhbGxvdyB0aG9zZSBtdWx0aS1kZXZpY2UgZmlsZXN5c3RlbXMgdG8g
YmUgaW50ZWdyYXRlZCB0byB1c2UKPj4gZnNfaG9sZGVyX29wczoKPj4KPj4gLSBSZXBsYWNlIHN1
cGVyX29wZWFyYXRpb246OnNodXRkb3duKCkgd2l0aAo+PiAgICBzdXBlcl9vcGVhcmF0aW9uczo6
cmVtb3ZlX2JkZXYoKQo+PiAgICBUbyBiZXR0ZXIgZGVzY3JpYmUgd2hlbiB0aGUgY2FsbGJhY2sg
aXMgY2FsbGVkLgo+IAo+IFRoaXMgY29uZmxhdGVzIGNhdXNlIHdpdGggYWN0aW9uLgo+IAo+IFRo
ZSBzaHV0ZG93biBjYWxsb3V0IGlzIGFuIGFjdGlvbiB0aGF0IHRoZSBmaWxlc3lzdGVtIG11c3Qg
ZXhlY3V0ZSwKPiB3aGlsc3QgInJlbW92ZSBiZGV2IiBpcyBhIGNhdXNlIG5vdGlmaWNhdGlvbiB0
aGF0IG1pZ2h0IHJlcXVpcmUgYW4KPiBhY3Rpb24gdG8gYmUgdGFrZS4KPiAKPiBZZXMsIHRoZSBj
YXVzZSBjb3VsZCBiZSBzb21lb25lIGRvaW5nIGhvdC11bnBsdWcgb2YgdGhlIGJsb2NrCj4gZGV2
aWNlLCBidXQgaXQgY291bGQgYWxzbyBiZSBzb21ldGhpbmcgZ29pbmcgd3JvbmcgaW4gc29mdHdh
cmUKPiBsYXllcnMgYmVsb3cgdGhlIGZpbGVzeXN0ZW0uIGUuZy4gZG0tdGhpbnAgaGF2aW5nIGFu
IHVucmVjb3ZlcmFibGUKPiBjb3JydXB0aW9uIG9yIEVOT1NQQyBlcnJvcnMuCj4gCj4gV2UgYWxy
ZWFkeSBoYXZlIGEgImNhdXNlIiBub3RpZmljYXRpb246IGJsa19ob2xkZXJfb3BzLT5tYXJrX2Rl
YWQoKS4KPiAKPiBUaGUgZ2VuZXJpYyBmcyBhY3Rpb24gdGhhdCBpcyB0YWtlbiBieSB0aGlzIG5v
dGlmaWNhdGlvbiBpcwo+IGZzX2JkZXZfbWFya19kZWFkKCkuICBUaGF0IGFjdGlvbiBpcyB0byBp
bnZhbGlkYXRlIGNhY2hlcyBhbmQgc2h1dAo+IGRvd24gdGhlIGZpbGVzeXN0ZW0uCj4gCj4gYnRy
ZnMgbmVlZHMgdG8gZG8gc29tZXRoaW5nIGRpZmZlcmVudCB0byBhIGJsa19ob2xkZXJfb3BzLT5t
YXJrX2RlYWQKPiBub3RpZmljYXRpb24uIGkuZS4gaXQgbmVlZHMgYW4gYWN0aW9uIHRoYXQgaXMg
ZGlmZmVyZW50IHRvCj4gZnNfYmRldl9tYXJrX2RlYWQoKS4KPiAKPiBJbmRlZWQsIHRoaXMgaXMg
aG93IGJjYWNoZWZzIGFscmVhZHkgaGFuZGxlcyAic2luZ2xlIGRldmljZQo+IGRpZWQiIGV2ZW50
cyBmb3IgbXVsdGktZGV2aWNlIGZpbGVzeXN0ZW1zIC0gc2VlCj4gYmNoMl9mc19iZGV2X21hcmtf
ZGVhZCgpLgoKSSBkbyBub3QgdGhpbmsgaXQncyB0aGUgY29ycmVjdCB3YXkgdG8gZ28sIGVzcGVj
aWFsbHkgd2hlbiB0aGVyZSBpcyAKYWxyZWFkeSBmc19ob2xkZXJfb3BzLgoKV2UncmUgYWx3YXlz
IGdvaW5nIHRvd2FyZHMgYSBtb3JlIGdlbmVyaWMgc29sdXRpb24sIG90aGVyIHRoYW4gbGV0dGlu
ZyAKdGhlIGluZGl2aWR1YWwgZnMgdG8gZG8gdGhlIHNhbWUgdGhpbmcgc2xpZ2h0bHkgZGlmZmVy
ZW50bHkuCgpZZXMsIHRoZSBuYW1pbmcgaXMgbm90IHBlcmZlY3QgYW5kIG1peGluZyBjYXVzZSBh
bmQgYWN0aW9uLCBidXQgdGhlIGVuZCAKcmVzdWx0IGlzIHN0aWxsIGEgbW9yZSBnZW5lcmljIGFu
ZCBsZXNzIGR1cGxpY2F0ZWQgY29kZSBiYXNlLgoKPiAKPiBIZW5jZSBCdHJmcyBzaG91bGQgYmUg
ZG9pbmcgdGhlIHNhbWUgdGhpbmcgYXMgYmNhY2hlZnMuIFRoZQo+IGJkZXZfaGFuZGxlX29wcyBz
dHJ1Y3R1cmUgZXhpc3RzIHByZWNpc2x5IGJlY2F1c2UgaXQgYWxsb3dzIHRoZQo+IGZpbGVzeXN0
ZW0gdG8gaGFuZGxlIGJsb2NrIGRldmljZSBldmVudHMgaW4gdGhlIGV4YWN0IG1hbm5lciB0aGV5
Cj4gcmVxdWlyZS4uLi4KPiAKPj4gLSBBZGQgYSBuZXcgQGJkZXYgcGFyYW1ldGVyIHRvIHJlbW92
ZV9iZGV2KCkgY2FsbGJhY2sKPj4gICAgVG8gYWxsb3cgdGhlIGZzIHRvIGRldGVybWluZSB3aGlj
aCBkZXZpY2UgaXMgbWlzc2luZywgYW5kIGRvIHRoZQo+PiAgICBwcm9wZXIgaGFuZGxpbmcgd2hl
biBuZWVkZWQuCj4+Cj4+IEZvciB0aGUgZXhpc3Rpbmcgc2h1dGRvd24gY2FsbGJhY2sgdXNlcnMs
IHRoZSBjaGFuZ2UgaXMgbWluaW1hbC4KPiAKPiBFeGNlcHQgZm9yIHRoZSBjaGFuZ2UgaW4gQVBJ
IHNlbWFudGljcy4gLT5zaHV0ZG93biBpcyBhbiBleHRlcm5hbAo+IHNodXRkb3duIHRyaWdnZXIg
Zm9yIHRoZSBmaWxlc3lzdGVtLCBub3QgYSBnZW5lcmljICJibG9jayBkZXZpY2UKPiByZW1vdmVk
IiBub3RpZmljYXRpb24uCgpUaGUgcHJvYmxlbSBpcywgdGhlcmUgaXMgbm8gb25lIHV0aWxpemlu
ZyAtPnNodXRkb3duKCkgb3V0IG9mIApmc19iZGV2X21hcmtfZGVhZCgpLgoKSWYgc2h1dGRvd24g
aW9jdGwgaXMgaGFuZGxlZCB0aHJvdWdoIHN1cGVyX29wZXJhdGlvbnM6OnNodXRkb3duLCBpdCB3
aWxsIApiZSBtb3JlIG1lYW5pbmdmdWwgdG8gc3BsaXQgc2h1dGRvd24gYW5kIGRldiByZW1vdmFs
LgoKQnV0IHRoYXQncyBub3QgdGhlIGNhc2UsIGFuZCBkaWZmZXJlbnQgZnNlcyBldmVuIGhhdmUg
c2xpZ2h0bHkgZGlmZmVyZW50IApoYW5kbGluZyBmb3IgdGhlIHNodXRkb3duIGZsYWdzIChub3Qg
YWxsIGZzZXMgZXZlbiB1dGlsaXplIGpvdXJuYWwgdG8gCnByb3RlY3QgdGhlaXIgbWV0YWRhdGEp
LgoKVGhhbmtzLApRdQoKCj4gCj4gSG9va2luZyBibGtfaG9sZGVyX29wcy0+bWFya19kZWFkIG1l
YW5zIHRoYXQgYnRyZnMgY2FuIGFsc28gcHJvdmlkZQo+IGEgLT5zaHV0ZG93biBpbXBsZW1lbnRh
dGlvbiBmb3Igd2hlbiBzb21ldGhpbmcgZXh0ZXJuYWwgb3RoZXIgdGhhbiBhCj4gYmxvY2sgZGV2
aWNlIHJlbW92YWwgbmVlZHMgdG8gc2h1dCBkb3duIHRoZSBmaWxlc3lzdGVtLi4uLgo+IAo+IC1E
YXZlLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
