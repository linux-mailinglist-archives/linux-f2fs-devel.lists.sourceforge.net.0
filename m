Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5505CAFC202
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 07:29:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewSBYbA5kaOJvqpMBSQ+qw2V3vyJv16OEL71MLnVTIA=; b=QRoiFHqg6M16xfRoIhGwO7vs9o
	DBg8/RkuhfjwjbquSm51L2jva+Gc7v8n6nkWI39YZYe9CPgEKkoJ7wXftGbWuLSAUSSNsJHS2kxzy
	wjRHBBR6dvA1EuRGFWsREDb6tCQwMvXbRnpri5WBmaPpkjZfcqfEv5Fp3kofjwzIbxKk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZ0tN-0007Zw-Kj;
	Tue, 08 Jul 2025 05:29:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1uZ0sm-0007ZD-Cj
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 05:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Omo6LLgJyVULzloJLyFZcLDr3jdzW0nRsKBFp8OqSOU=; b=dEFqdOQ7FKMH99JZh/topqRmV4
 raqvfWEdGHn8MujHu3nscoHwrvi4tL6Q14ovM3QNzgInibmTM3JrKiHwiOEsf0nzGMH2MJONguRrc
 +iQ7x5m2NM8PPTgZdGhzde7LmDvHvJaSEz9dWnOlakBHErLlaTIKBDiJuvt4Z10O2p0A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Omo6LLgJyVULzloJLyFZcLDr3jdzW0nRsKBFp8OqSOU=; b=bJRDww63YLz/GOFWykWtRUHin/
 YOq/GCbTanMtXaMYsApUq4JE+g+b/P/hAzvHnEZ8hrXbfzqFtJRCFmLgMr14cSi0wa7Ni8FwhsH9G
 9TkpocAp679dfNOVjggzzlHWepg2UfEJdwAkg+L1jYSP2Azzr7Qa/0ApUqfYCShYa9Jo=;
Received: from mail-io1-f52.google.com ([209.85.166.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uZ0sl-0001gr-PK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 05:28:44 +0000
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-874a68f6516so398426439f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Jul 2025 22:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1751952518; x=1752557318;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Omo6LLgJyVULzloJLyFZcLDr3jdzW0nRsKBFp8OqSOU=;
 b=LTVqRLhqhzpwLh8CYtupGyir/PirL8rrC4G5pyH/GcyuSUOpPINhAHbFzLwGClKA6H
 laF66fWma3IEPM70gvjJVGrhnZSJGrD7tO5ZeaSlMzH97kFqwDf5SqSdDkbcJnhQgzJM
 tawbpUe531CdddftJ2Th8gbGJCFmA5oZm2ZoywUm1dkQr3QBrfP8bCgATclPXxgmFk+T
 IfJnzNeDBF+GhXDckgcy+nMGn9DV+dApyg1QJ+1eYzsxEL54+DfyucrHs34ZGw4gAXJh
 vFe+pa0o/cLA+6t1Og4uTuvLYcSH8KEyEXfDzSxdFLYcoI9j2CzXWF/3buPKsutN+jDU
 bstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751952518; x=1752557318;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Omo6LLgJyVULzloJLyFZcLDr3jdzW0nRsKBFp8OqSOU=;
 b=K4Yv8R24T6qVp+R4SsB95i+Hq6edeV+fUFODrnzP00cPWcqlL9W4RLpLaaWSkolKuK
 O4fXvbKk/281lWVhRyhNF9BrJJWuul1IoUuYHKlDhe/Xjk9ZFK4EIO29Ly79c8Nloa8q
 ydwFjwhknRP6ZdP1JF+8IG0C3RVVZGULYcnqWQj1UQTUsS4ONcSN6r5vU4QtFugUj9zZ
 WJwclmZ1O3jH67lP6yokcL8Q0mDIFdikaaOcvrJtBmUVMJnLbEwtj0VasSRXH/EybR6F
 2zj0EakvaZ76R5lbJ1g9hdrYXOrYe//o0brU3zkR1lM3tJa9slAMOzd4sGF7VV4Avvpq
 NuaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKC1FQNwDF3Hk/YMYPsPYN8hxfAnTgwkB2T77Q0grem+8W1AZ62/rUBUlz68VNpUsOegqUui1CbON9VsmUf9Ed@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzKGGX3rHIR5CVes4Crc+60EuxwZcAH3uy3hbbp9NHuy+UQkz+R
 MdYJLZYLCQ6N/JF+BTDYUYskATPJyYJr4tPT0KdWfuZTjrQse6pUk0sKWJlwh6a3x9NAX85BUUZ
 +yoUT
X-Gm-Gg: ASbGncsLrXXYjcg2gIZwwSa8cTrE+CuJINxWuJQhmDFOZg/p78a1ohqnmils+Rm6v+/
 3MnloirY/+AM3o6GZso6TaPTaJBhlhlYu098uyJg2Cwa2PeKyfCmu18IRHB9GoBP/36ZQDeHIzn
 hvzkXT2hvbFYShDS3nWhL7PaGybleXWKCYH+vA1TnHT7vZimJy2ghqVP+4cbhYDDQaGS9hHgbXh
 WZb7Cj4AO5yzABS5qUNjfHEaCLPdLhumA/weV8lRmctMs6OOkqhvbIEz06cOGcfhXvBg9He/h92
 YP2thkDwfr/zv0x/Oy7VWms1q6aKaorjX1mIatoKtERefpLjUFoNc9mcLU7RONRGQFbJb5/Nq02
 iS2UCa68NT4g62YT80GyIsjV/pwZAejcY5xqqtw==
X-Google-Smtp-Source: AGHT+IGsHUT6Bi+76saZTNBr04hdGSYcx5107pQyHdDmPfUk8q23TTXe1KfcBJmRM20GAyE10VbqJw==
X-Received: by 2002:a05:6a20:728b:b0:1f5:8c05:e8f8 with SMTP id
 adf61e73a8af0-22b4449d668mr3073800637.25.1751951140491; 
 Mon, 07 Jul 2025 22:05:40 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-184-88.pa.nsw.optusnet.com.au.
 [49.180.184.88]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3918d81a3fsm4275006a12.15.2025.07.07.22.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 22:05:39 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
 (envelope-from <david@fromorbit.com>) id 1uZ0WP-00000008J2c-0q8k;
 Tue, 08 Jul 2025 15:05:37 +1000
Date: Tue, 8 Jul 2025 15:05:37 +1000
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Message-ID: <aGynIewLL-05fuoJ@dread.disaster.area>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
 <02584a40-a2c0-4565-ab46-50c1a4100b21@gmx.com>
 <bdce1e62-c6dd-4f40-b207-cfaf4c5e25e4@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bdce1e62-c6dd-4f40-b207-cfaf4c5e25e4@gmx.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Jul 08, 2025 at 12:36:48PM +0930, Qu Wenruo wrote:
    > 在 2025/7/8 11:39, Qu Wenruo 写道: > > 在 2025/7/8 10:15, Darrick J.
    Wong 写道: > > > > Yes, the naming is not perfect and mixing cau [...] 
 
 Content analysis details:   (0.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
                             was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
                              for more information.
                             [209.85.166.52 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.52 listed in wl.mailspike.net]
X-Headers-End: 1uZ0sl-0001gr-PK
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: brauner@kernel.org, ntfs3@lists.linux.dev, jack@suse.cz,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Qu Wenruo <wqu@suse.com>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKdWwgMDgsIDIwMjUgYXQgMTI6MzY6NDhQTSArMDkzMCwgUXUgV2VucnVvIHdyb3Rl
Ogo+IOWcqCAyMDI1LzcvOCAxMTozOSwgUXUgV2VucnVvIOWGmemBkzoKPiA+IOWcqCAyMDI1Lzcv
OCAxMDoxNSwgRGFycmljayBKLiBXb25nIOWGmemBkzoKPiA+ID4gPiBZZXMsIHRoZSBuYW1pbmcg
aXMgbm90IHBlcmZlY3QgYW5kIG1peGluZyBjYXVzZSBhbmQgYWN0aW9uLCBidXQgdGhlIGVuZAo+
ID4gPiA+IHJlc3VsdCBpcyBzdGlsbCBhIG1vcmUgZ2VuZXJpYyBhbmQgbGVzcyBkdXBsaWNhdGVk
IGNvZGUgYmFzZS4KPiA+ID4gCj4gPiA+IEkgdGhpbmsgZGNoaW5uZXIgbWFrZXMgYSBnb29kIHBv
aW50IHRoYXQgaWYgeW91ciBmaWxlc3lzdGVtIGNhbiBkbwo+ID4gPiBzb21ldGhpbmcgY2xldmVy
IG9uIGRldmljZSByZW1vdmFsLCBpdCBzaG91bGQgcHJvdmlkZSBpdHMgb3duIGJsb2NrCj4gPiA+
IGRldmljZSBob2xkZXIgb3BzIGluc3RlYWQgb2YgdXNpbmcgZnNfaG9sZGVyX29wcy4KPiA+IAo+
ID4gVGhlbiByZS1pbXBsZW1lbnQgYSBsb3Qgb2YgdGhpbmdzIGxpa2UgYmRldl9zdXBlcl9sb2Nr
KCk/CgpJREdJLiBTaW1wbHkgYWRkOgoKRVhQT1JUX1NZTUJPTF9HUEwoZ2V0X2JkZXZfc3VwZXIp
OwoKQW5kIHRoZSBwcm9ibGVtIGlzIHNvbHZlZC4KCj4gPiBJJ2QgcHJlZmVyIG5vdC4KPiA+IAo+
ID4gCj4gPiBmc19ob2xkZXJfb3BzIHNvbHZlcyBhIGxvdCBvZiB0aGluZ3MgbGlrZSBoYW5kbGlu
ZyBtb3VudGluZy9pbmFjdGl2ZQo+ID4gZnNlcywgYW5kIHB1c2hpbmcgaXQgYmFjayBhZ2FpbiB0
byB0aGUgZnMgY29kZSBpcyBqdXN0IGNhdXNpbmcgbW9yZQo+ID4gZHVwbGljYXRpb24uCgpUaGlz
IGlzIGFsbCBlbmNhcHN1bGF0ZWQgaW4gZ2V0X2JkZXZfc3VwZXIoKSwgc28gYnRyZnMgZG9lc24n
dCBuZWVkCnRvIGltcGxlbWVudCBhbnkgb2YgdGhpcy4gZ2V0X2JkZXZfc3VwZXIvZGVhY3RpdmF0
ZV9zdXBlciBpcyB0aGUgQVBJCnlvdSBzaG91bGQgYmUgdXNpbmcgd2l0aCB0aGUgYmxrX2hvbGRl
cl9vcHMgbWV0aG9kcy4KCj4gPiBOb3QgcmVhbGx5IHdvcnRoeSBpZiB3ZSBvbmx5IHdhbnQgYSBz
aW5nbGUgZGlmZmVyZW50IGJlaGF2aW9yLgoKVGhpcyBpcyB0aGUgKjNyZCogZGlmZmVyZW50IGJl
aGF2aW91ciBmb3IgLT5tYXJrX2RlYWQuIFdlCmhhdmUgdGhlIGdlbmVyaWMgYmVoYXZpb3VyLCB0
aGUgYmNhY2hlZnMgYmVoYXZpb3VyLCBhbmQgbm93IHRoZQpidHJmcyBiZWhhdmlvdXIgKHdoYXRl
dmVyIHRoYXQgbWF5IGJlKS4KCj4gPiBUaHVzIEkgc3Ryb25nbHkgcHJlZmVyIHRvIGRvIHdpdGgg
dGhlIGV4aXN0aW5nIGZzX2hvbGRlcl9vcHMsIG5vIG1hdHRlcgo+ID4gaWYgaXQncyB1c2luZy9y
ZW5hbWluZyB0aGUgc2h1dGRvd24oKSBjYWxsYmFjaywgb3IgYSBuZXcgY2FsbGJhY2suCj4gCj4g
UHJldmlvdXNseSBDaHJpc3RvcGggaXMgYWdhaW5zdCBhIG5ldyAtPnJlbW92ZV9iZGV2KCkgY2Fs
bGJhY2ssIGFzIGl0IGlzCj4gY29uZmxpY3Rpbmcgd2l0aCB0aGUgZXhpc3RpbmcgLT5zaHV0ZG93
bigpLgo+IAo+IFNvIHdoYXQgYWJvdXQgYSBuZXcgLT5oYW5kbGVfYmRldl9yZW1vdmUoKSBjYWxs
YmFjaywgdGhhdCB3ZSBkbyBzb21ldGhpbmcKPiBsaWtlIHRoaXMgaW5zaWRlIGZzX2JkZXZfbWFy
a19kZWFkKCk6Cj4gCj4gewo+IAliZGV2X3N1cGVyX2xvY2soKTsKPiAJaWYgKCFzdXJwcmlzZSkK
PiAJCXN5bmNfZmlsZXN5c3RlbSgpOwo+IAo+IAlpZiAoc19vcC0+aGFuZGxlX2JkZXZfcmVtb3Zl
KSB7Cj4gCQlyZXQgPSBzX29wLT5oYW5kbGVfYmRldl9yZW1vdmUoKTsKPiAJCWlmICghcmV0KSB7
Cj4gCQkJc3VwZXJfdW5sb2NrX3NoYXJlZCgpOwo+IAkJCXJldHVybjsKPiAJCX0KPiAJfQo+IAlz
aHJpbmtfZGNhY2hlX3NiKCk7Cj4gCWV2aWN0X2lub2RlcygpOwo+IAlpZiAoc19vcC0+c2h1dGRv
d24pCj4gCQlzX29wLT5zaHV0ZG93bigpOwo+IH0KPiAKPiBTbyB0aGF0IHRoZSBuZXcgLT5oYW5k
bGVfYmRldl9yZW1vdmUoKSBpcyBub3QgY29uZmxpY3Rpbmcgd2l0aAo+IC0+c2h1dGRvd24oKSBi
dXQgYW4gb3B0aW9uYWwgb25lLgo+IAo+IEFuZCBpZiB0aGUgZnMgY2FuIG5vdCBoYW5kbGUgdGhl
IHJlbW92YWwsIGp1c3QgbGV0Cj4gLT5oYW5kbGVfYmRldl9yZW1vdmUoKSByZXR1cm4gYW4gZXJy
b3Igc28gdGhhdCB3ZSBmYWxsYmFjayB0byB0aGUgZXhpc3RpbmcKPiBzaHV0ZG93biByb3V0aW5l
Lgo+IAo+IFdvdWxkIHRoaXMgYmUgbW9yZSBhY2NlcHRhYmxlPwoKTm8uCgotRGF2ZS4KLS0gCkRh
dmUgQ2hpbm5lcgpkYXZpZEBmcm9tb3JiaXQuY29tCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
