Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F3CAFDC95
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 02:55:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMHhAY5lCjYQGYacWVIX5KbLV4Ifa47xFcKp85gqcwA=; b=jCuMA4mhFqsrdXCj7Z6JBCma/+
	6LyF30IWrWpl4Rsdn5W2HhdvW5S0nR2Lhzx38bbzsV+/LbZL5m0MJLXcKAodIoRpkft8Y7Z0vM50c
	wNiZsyzXSB5CuVMhNumuKqwAliLlSf2ONjQavlXYONMIorwMY/zpc4XiJjgOz/KZ4YR0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZJ6D-0007PI-0g;
	Wed, 09 Jul 2025 00:55:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quwenruo.btrfs@gmx.com>) id 1uZJ6B-0007PB-Mj
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 00:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J7Noojv8EhaGmsF8cdDLD8Vh1yUJu0qM0pvHlEj+l9I=; b=FBvt/sbuF+QEjKsBpMXZpUV0/d
 0ngZaTfq5YXinXGsewtNsfEMjNnZGd13h6LY59/2zK267gA3VKUzP6nGTFDmZSF39LqbJaUQQRvBA
 Vq9r0v3aeBeSwuq1FJMQB84cnw+1nM4A9RhJ9qJVduwyFxgY2UkqrCevB69RmCKLHvuQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J7Noojv8EhaGmsF8cdDLD8Vh1yUJu0qM0pvHlEj+l9I=; b=CJqx7hPhP0KX/xWzHnblNsL7z8
 +u70Ff8XIPyVTP/JMqK/SsivA9cDaYVLnN/Fli7AzRo5e9YTIJBzCaZf8BfZXKSiUfeWBqugUrIDb
 5jA2dZwK51QLr+AXkAMQ7JnznD/OvOJt5PhN1tqwuI2guMZxRGksuA689/LIvCmSo+8o=;
Received: from mout.gmx.net ([212.227.17.20])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZJ6A-0003HK-J0 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 00:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1752022517; x=1752627317; i=quwenruo.btrfs@gmx.com;
 bh=J7Noojv8EhaGmsF8cdDLD8Vh1yUJu0qM0pvHlEj+l9I=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=NrATP4JwKJI/Jk/YtvsohJRowJENTHCQ90LCIfD5MV4KpABIez/SGgFnFoGr0sAT
 6CKnXuD2S8zrnlYXcE6hxxpNWdWMnF501cyMQTEuhsjZDPKCZklas+WjQa+m2E+Cj
 ty2zTeJqr4wrmUmgP9RetYsQ3A9nQr5+Gg6i57EJqp3KibX5od+B46cTVctWKx/3O
 gaE7qR3I3XC0F6x8+bJ3R7ilWQirKYAUkXX/gmdyhhj48Yegb6InjWPOI0PWNbQFS
 U/YRbSZhU/C3kDt4Nhf2e88McB/MZ+pWsNeoR2ZPAg6IOt46PODLqbqlRx29jWnaW
 cKM73T+Vy889i4Uyyw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.229] ([159.196.52.54]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MGQj7-1uRGbA0A4T-006Owy; Wed, 09
 Jul 2025 02:55:17 +0200
Message-ID: <eb7c3b1c-b5c0-4078-9a88-327f1220cae8@gmx.com>
Date: Wed, 9 Jul 2025 10:25:08 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kent Overstreet <kent.overstreet@linux.dev>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
 <20250708-geahndet-rohmaterial-0419fd6a76b3@brauner>
 <aG2i3qP01m-vmFVE@dread.disaster.area>
 <00f5c2a2-4216-4eeb-b555-ef49f8cfd447@gmx.com>
 <lcbj2r4etktljckyv3q4mgryvwqsbl7pwe6sqdtyfwgmunhkov@4oinzvvnt44s>
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
In-Reply-To: <lcbj2r4etktljckyv3q4mgryvwqsbl7pwe6sqdtyfwgmunhkov@4oinzvvnt44s>
X-Provags-ID: V03:K1:KoRb14HHFIAA+xqWmHqOQOGOiXTovP17rrEdeiqQxz8aS+6I5Tb
 rhHCePgI9F49lmQs60u319Dd0Lq0RzAW22Jtsfjd2DXnag5nje5Nl6cgBKyT+m0SIociET6
 wCrOSY2ZsdYkY9sCzzk9qQQt2wJfrOsp3A6uQBSZ8wXXwTh8b49w2ljv5K9slLAy/cXQtFo
 9EhGpkqbThnDWor1J0YnQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jmQnZt7y5Qg=;d3CB1vWdsEGlq9XHF3omUXIjtiY
 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
 012xsk4XwNAK6aJyA6oxhs7NZsa4D1yw=
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/7/9 10:05, Kent Overstreet 写道: > On Wed, Jul
    09, 2025 at 08:37:05AM +0930, Qu Wenruo wrote: >> 在 2025/7/9 08:29, Dave
    Chinner 写道: >>> On Tue, Jul 08, 2025 at 09:55:14AM +0200, Chris [...]
    
 
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
                             [212.227.17.20 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uZJ6A-0003HK-J0
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
Cc: Christian Brauner <brauner@kernel.org>, ntfs3@lists.linux.dev, jack@suse.cz,
 "Darrick J. Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Qu Wenruo <wqu@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyNS83LzkgMTA6MDUsIEtlbnQgT3ZlcnN0cmVldCDlhpnpgZM6Cj4gT24gV2VkLCBK
dWwgMDksIDIwMjUgYXQgMDg6Mzc6MDVBTSArMDkzMCwgUXUgV2VucnVvIHdyb3RlOgo+PiDlnKgg
MjAyNS83LzkgMDg6MjksIERhdmUgQ2hpbm5lciDlhpnpgZM6Cj4+PiBPbiBUdWUsIEp1bCAwOCwg
MjAyNSBhdCAwOTo1NToxNEFNICswMjAwLCBDaHJpc3RpYW4gQnJhdW5lciB3cm90ZToKPj4+PiBP
biBNb24sIEp1bCAwNywgMjAyNSBhdCAwNTo0NTozMlBNIC0wNzAwLCBEYXJyaWNrIEouIFdvbmcg
d3JvdGU6Cj4+Pj4+IE9uIFR1ZSwgSnVsIDA4LCAyMDI1IGF0IDA4OjUyOjQ3QU0gKzA5MzAsIFF1
IFdlbnJ1byB3cm90ZToKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4g5ZyoIDIwMjUvNy84IDA4OjMyLCBE
YXZlIENoaW5uZXIg5YaZ6YGTOgo+Pj4+Pj4+IE9uIEZyaSwgSnVsIDA0LCAyMDI1IGF0IDEwOjEy
OjI5QU0gKzA5MzAsIFF1IFdlbnJ1byB3cm90ZToKPj4+Pj4+Pj4gQ3VycmVudGx5IGFsbCB0aGUg
ZmlsZXN5c3RlbXMgaW1wbGVtZW50aW5nIHRoZQo+Pj4+Pj4+PiBzdXBlcl9vcGVhcmF0aW9uczo6
c2h1dGRvd24oKSBjYWxsYmFjayBjYW4gbm90IGFmZm9yZCBsb3NpbmcgYSBkZXZpY2UuCj4+Pj4+
Pj4+Cj4+Pj4+Pj4+IFRodXMgZnNfYmRldl9tYXJrX2RlYWQoKSB3aWxsIGp1c3QgY2FsbCB0aGUg
c2h1dGRvd24oKSBjYWxsYmFjayBmb3IgdGhlCj4+Pj4+Pj4+IGludm9sdmVkIGZpbGVzeXN0ZW0u
Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEJ1dCBpdCB3aWxsIG5vIGxvbmdlciBiZSB0aGUgY2FzZSwgd2l0
aCBtdWx0aS1kZXZpY2UgZmlsZXN5c3RlbXMgbGlrZQo+Pj4+Pj4+PiBidHJmcyBhbmQgYmNhY2hl
ZnMgdGhlIGZpbGVzeXN0ZW0gY2FuIGhhbmRsZSBjZXJ0YWluIGRldmljZSBsb3NzIHdpdGhvdXQK
Pj4+Pj4+Pj4gc2h1dHRpbmcgZG93biB0aGUgd2hvbGUgZmlsZXN5c3RlbS4KPj4+Pj4+Pj4KPj4+
Pj4+Pj4gVG8gYWxsb3cgdGhvc2UgbXVsdGktZGV2aWNlIGZpbGVzeXN0ZW1zIHRvIGJlIGludGVn
cmF0ZWQgdG8gdXNlCj4+Pj4+Pj4+IGZzX2hvbGRlcl9vcHM6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IC0g
UmVwbGFjZSBzdXBlcl9vcGVhcmF0aW9uOjpzaHV0ZG93bigpIHdpdGgKPj4+Pj4+Pj4gICAgICBz
dXBlcl9vcGVhcmF0aW9uczo6cmVtb3ZlX2JkZXYoKQo+Pj4+Pj4+PiAgICAgIFRvIGJldHRlciBk
ZXNjcmliZSB3aGVuIHRoZSBjYWxsYmFjayBpcyBjYWxsZWQuCj4+Pj4+Pj4KPj4+Pj4+PiBUaGlz
IGNvbmZsYXRlcyBjYXVzZSB3aXRoIGFjdGlvbi4KPj4+Pj4+Pgo+Pj4+Pj4+IFRoZSBzaHV0ZG93
biBjYWxsb3V0IGlzIGFuIGFjdGlvbiB0aGF0IHRoZSBmaWxlc3lzdGVtIG11c3QgZXhlY3V0ZSwK
Pj4+Pj4+PiB3aGlsc3QgInJlbW92ZSBiZGV2IiBpcyBhIGNhdXNlIG5vdGlmaWNhdGlvbiB0aGF0
IG1pZ2h0IHJlcXVpcmUgYW4KPj4+Pj4+PiBhY3Rpb24gdG8gYmUgdGFrZS4KPj4+Pj4+Pgo+Pj4+
Pj4+IFllcywgdGhlIGNhdXNlIGNvdWxkIGJlIHNvbWVvbmUgZG9pbmcgaG90LXVucGx1ZyBvZiB0
aGUgYmxvY2sKPj4+Pj4+PiBkZXZpY2UsIGJ1dCBpdCBjb3VsZCBhbHNvIGJlIHNvbWV0aGluZyBn
b2luZyB3cm9uZyBpbiBzb2Z0d2FyZQo+Pj4+Pj4+IGxheWVycyBiZWxvdyB0aGUgZmlsZXN5c3Rl
bS4gZS5nLiBkbS10aGlucCBoYXZpbmcgYW4gdW5yZWNvdmVyYWJsZQo+Pj4+Pj4+IGNvcnJ1cHRp
b24gb3IgRU5PU1BDIGVycm9ycy4KPj4+Pj4+Pgo+Pj4+Pj4+IFdlIGFscmVhZHkgaGF2ZSBhICJj
YXVzZSIgbm90aWZpY2F0aW9uOiBibGtfaG9sZGVyX29wcy0+bWFya19kZWFkKCkuCj4+Pj4+Pj4K
Pj4+Pj4+PiBUaGUgZ2VuZXJpYyBmcyBhY3Rpb24gdGhhdCBpcyB0YWtlbiBieSB0aGlzIG5vdGlm
aWNhdGlvbiBpcwo+Pj4+Pj4+IGZzX2JkZXZfbWFya19kZWFkKCkuICBUaGF0IGFjdGlvbiBpcyB0
byBpbnZhbGlkYXRlIGNhY2hlcyBhbmQgc2h1dAo+Pj4+Pj4+IGRvd24gdGhlIGZpbGVzeXN0ZW0u
Cj4+Pj4+Pj4KPj4+Pj4+PiBidHJmcyBuZWVkcyB0byBkbyBzb21ldGhpbmcgZGlmZmVyZW50IHRv
IGEgYmxrX2hvbGRlcl9vcHMtPm1hcmtfZGVhZAo+Pj4+Pj4+IG5vdGlmaWNhdGlvbi4gaS5lLiBp
dCBuZWVkcyBhbiBhY3Rpb24gdGhhdCBpcyBkaWZmZXJlbnQgdG8KPj4+Pj4+PiBmc19iZGV2X21h
cmtfZGVhZCgpLgo+Pj4+Pj4+Cj4+Pj4+Pj4gSW5kZWVkLCB0aGlzIGlzIGhvdyBiY2FjaGVmcyBh
bHJlYWR5IGhhbmRsZXMgInNpbmdsZSBkZXZpY2UKPj4+Pj4+PiBkaWVkIiBldmVudHMgZm9yIG11
bHRpLWRldmljZSBmaWxlc3lzdGVtcyAtIHNlZQo+Pj4+Pj4+IGJjaDJfZnNfYmRldl9tYXJrX2Rl
YWQoKS4KPj4+Pj4+Cj4+Pj4+PiBJIGRvIG5vdCB0aGluayBpdCdzIHRoZSBjb3JyZWN0IHdheSB0
byBnbywgZXNwZWNpYWxseSB3aGVuIHRoZXJlIGlzIGFscmVhZHkKPj4+Pj4+IGZzX2hvbGRlcl9v
cHMuCj4+Pj4+Pgo+Pj4+Pj4gV2UncmUgYWx3YXlzIGdvaW5nIHRvd2FyZHMgYSBtb3JlIGdlbmVy
aWMgc29sdXRpb24sIG90aGVyIHRoYW4gbGV0dGluZyB0aGUKPj4+Pj4+IGluZGl2aWR1YWwgZnMg
dG8gZG8gdGhlIHNhbWUgdGhpbmcgc2xpZ2h0bHkgZGlmZmVyZW50bHkuCj4+Pj4+Cj4+Pj4+IE9u
IHNlY29uZCB0aG91Z2h0IC0tIGl0J3Mgd2VpcmQgdGhhdCB5b3UnZCBmbHVzaCB0aGUgZmlsZXN5
c3RlbSBhbmQKPj4+Pj4gc2hyaW5rIHRoZSBpbm9kZS9kZW50cnkgY2FjaGVzIGluIGEgInlvdXIg
ZGV2aWNlIHdlbnQgYXdheSIgaGFuZGxlci4KPj4+Pj4gRmFuY3kgZmlsZXN5c3RlbXMgbGlrZSBi
Y2FjaGVmcyBhbmQgYnRyZnMgd291bGQgbGlrZWx5IGp1c3Qgc2hpZnQgSU8gdG8KPj4+Pj4gYSBk
aWZmZXJlbnQgYmRldiwgcmlnaHQ/ICBBbmQgdGhlcmUncyBubyBnb29kIHJlYXNvbiB0byBydW4g
c2hyaW5rZXJzIG9uCj4+Pj4+IGVpdGhlciBvZiB0aG9zZSBmc2VzLCByaWdodD8KPj4+Pj4KPj4+
Pj4+IFllcywgdGhlIG5hbWluZyBpcyBub3QgcGVyZmVjdCBhbmQgbWl4aW5nIGNhdXNlIGFuZCBh
Y3Rpb24sIGJ1dCB0aGUgZW5kCj4+Pj4+PiByZXN1bHQgaXMgc3RpbGwgYSBtb3JlIGdlbmVyaWMg
YW5kIGxlc3MgZHVwbGljYXRlZCBjb2RlIGJhc2UuCj4+Pj4+Cj4+Pj4+IEkgdGhpbmsgZGNoaW5u
ZXIgbWFrZXMgYSBnb29kIHBvaW50IHRoYXQgaWYgeW91ciBmaWxlc3lzdGVtIGNhbiBkbwo+Pj4+
PiBzb21ldGhpbmcgY2xldmVyIG9uIGRldmljZSByZW1vdmFsLCBpdCBzaG91bGQgcHJvdmlkZSBp
dHMgb3duIGJsb2NrCj4+Pj4+IGRldmljZSBob2xkZXIgb3BzIGluc3RlYWQgb2YgdXNpbmcgZnNf
aG9sZGVyX29wcy4gIEkgZG9uJ3QgdW5kZXJzdGFuZAo+Pj4+PiB3aHkgeW91IG5lZWQgYSAiZ2Vu
ZXJpYyIgc29sdXRpb24gZm9yIGJ0cmZzIHdoZW4gaXQncyBub3QgZ29pbmcgdG8gZG8KPj4+Pj4g
d2hhdCB0aGUgb3RoZXJzIGRvIGFueXdheS4KPj4+Pgo+Pj4+IEkgdGhpbmsgbGV0dGluZyBmaWxl
c3lzdGVtcyBpbXBsZW1lbnQgdGhlaXIgb3duIGhvbGRlciBvcHMgc2hvdWxkIGJlCj4+Pj4gYXZv
aWRlZCBpZiB3ZSBjYW4uIENocmlzdG9waCBtYXkgY2hpbWUgaW4gaGVyZS4gSSBoYXZlIG5vIGFw
cGV0dGl0ZSBmb3IKPj4+PiBleHBvcnRpbmcgc3R1ZmYgbGlrZSBnZXRfYmRldl9zdXBlcigpIHVu
bGVzcyBhYnNvbHV0ZWx5IG5lY2Vzc2FyeS4gV2UKPj4+PiB0cmllZCB0byBtb3ZlIGFsbCB0aGF0
IGhhbmRsaW5nIGludG8gdGhlIFZGUyB0byBlbGltaW5hdGUgYSBzbGV3IG9mCj4+Pj4gZGVhZGxv
Y2tzIHdlIGRldGVjdGVkIGFuZCBmaXhlZC4gSSBoYXZlIG5vIGFwcGV0aXRlIHRvIHJlcGVhdCB0
aGF0Cj4+Pj4gY3ljbGUuCj4+Pgo+Pj4gRXhjZXB0IGl0IGlzbid0IGFjdHVhbGx5IG5lY2Vzc2Fy
eS4KPj4+Cj4+PiBFdmVyeW9uZSBoZXJlIHNlZW1zIHRvIGJlIGFzc3VtaW5nIHRoYXQgdGhlIGZp
bGVzeXN0ZW0gKm11c3QqIHRha2UKPj4+IGFuIGFjdGl2ZSBzdXBlcmJsb2NrIHJlZmVyZW5jZSB0
byBwcm9jZXNzIGEgZGV2aWNlIHJlbW92YWwgZXZlbnQsCj4+PiBhbmQgdGhhdCBpcyAqc2ltcGx5
IG5vdCB0cnVlKi4KPj4+Cj4+PiBiY2FjaGVmcyBkb2VzIG5vdCB1c2UgZ2V0X2JkZXZfc3VwZXIo
KSBvciBhbiBhY3RpdmUgc3VwZXJibG9jawo+Pj4gcmVmZXJlbmNlIHRvIHByb2Nlc3MgLT5tYXJr
X2RlYWQgZXZlbnRzLgo+Pgo+PiBZZXMsIGJjYWNoZWZzIGRvZXNuJ3QgZ28gdGhpcyBwYXRoLCBi
dXQgdGhlIHJlYXNvbiBpcyBtb3JlIGltcG9ydGFudC4KPj4KPj4gSXMgaXQganVzdCBiZWNhdXNl
IHRoZXJlIGlzIG5vIHN1Y2ggY2FsbGJhY2sgc28gdGhhdCBLZW50IGhhcyB0byBjb21lIHVwIGhp
cwo+PiBvd24gc29sdXRpb24sIG9yIHNvbWV0aGluZyBlbHNlPwo+Pgo+PiBJZiB0aGUgZm9ybWVy
IGNhc2UsIGFsbCB5b3VyIGFyZ3VtZW50IGhlcmUgbWFrZXMgbm8gc2Vuc2UuCj4+Cj4+IEFkZGlu
ZyBLZW50IGhlcmUgdG8gc2VlIGlmIGhlIHdhbnRzIGEgbW9yZSBnZW5lcmljIHNfb3AtPnJlbW92
ZV9iZGV2KCkKPj4gc29sdXRpb24gb3IgdGhlIGN1cnJlbnQgZWFjaCBmcyBkb2luZyBpdHMgb3du
IG1hcmtfZGVhZCgpIGNhbGxiYWNrLgo+IAo+IENvbnNpZGVyIHRoYXQgdGhlIHRoaW5nIHRoYXQg
aGFzIGEgYmxvY2sgZGV2aWNlIG9wZW4gbWlnaHQgbm90IGV2ZW4gYmUgYQo+IGZpbGVzeXN0ZW0s
IG9yIGF0IGxlYXN0IGEgVkZTIGZpbGVzeXN0ZW0uCj4gCj4gSXQgY291bGQgYmUgYSBzdGFja2lu
ZyBibG9jayBkZXZpY2UgZHJpdmVyIC0gbWQgb3IgbWQgLSBhbmQgdGhvc2UKPiBhYnNvbHV0ZWx5
IHNob3VsZCBiZSBpbXBsZW1lbnRpbmcgLm1hcmtfZGVhZCgpIChsaWtlbHkgcGFzc2luZyBpdAo+
IHRocm91Z2ggb24gdXAgdGhlIHN0YWNrKSwgb3Igc29tZXRoaW5nIGVsc2UgZW50aXJlbHkuCj4g
Cj4gSW4gYmNhY2hlZnMncyBjYXNlLCB3ZSBtaWdodCBub3QgZXZlbiBoYXZlIGNyZWF0ZWQgdGhl
IFZGUyBzdXBlcl9ibG9jawo+IHlldDogd2UgZG9uJ3QgZG8gdGhhdCB1bnRpbCBhZnRlciByZWNv
dmVyeSBmaW5pc2hlcywgYW5kIGluZGVlZCB3ZSBjYW4ndAo+IGJlY2F1c2UgY3JlYXRpbmcgYSBz
dXBlcl9ibG9jayBhbmQgbGVhdmluZyBpdCBpbiAhU0JfQk9STiB3aWxsIGNhdXNlCj4gc3VjaCBm
dW4gYXMgc3luYyBjYWxscyB0byBoYW5nIGZvciB0aGUgZW50aXJlIHN5c3RlbS4uLgo+IAoKTm90
IHJlbGF0ZWQgdG8gdGhlIHNlcmllcywgYnV0IElJUkMgaWYgc19mbGFncyBkb2Vzbid0IGhhdmUg
U0JfQUNUSVZFIApzZXQsIHRoaW5ncyBsaWtlIGJkZXZfc3VwZXJfbG9jaygpIHdvbid0IGNob29z
ZSB0aGF0IHN1cGVyYmxvY2ssIHRodXMgCndvbid0IGNhbGwgLT5zeW5jKCkgY2FsbGJhY2sgdGhy
b3VnaCB0aGUgYmRldiBjYWxsYmFja3MuCgpBbmQgYnRyZnMgYWxzbyBmb2xsb3dzIHRoZSBzYW1l
IHNjaGVtZSwgb25seSBzZXR0aW5nIFNCX0FDVElWRSBhZnRlciAKZXZlcnl0aGluZyBpcyBkb25l
IChpbmNsdWRpbmcgcmVwbGF5aW5nIHRoZSBsb2cgZXRjKSwgYW5kIHNvIGZhciB3ZSAKaGF2ZW4n
dCB5ZXQgaGl0IHN1Y2ggc3luYyBkdXJpbmcgbW91bnQuCgpUaGFua3MsClF1CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
