Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D8644DE36
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Nov 2021 00:00:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mlJ3E-0005Pd-Tz; Thu, 11 Nov 2021 23:00:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <torvalds@linuxfoundation.org>) id 1mlJ3C-0005PS-6R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Nov 2021 23:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5D3+4vJF30PnckXaBwwWrlTwdIUWKxzS4vTsfPc8j0o=; b=CWFriGqSba022ab7k3Db1NLfSt
 MMu820faxdNsXbkFPXQYqRSIg+tRuSJZ80R1QL3lc7wef9hKbBQEHq8BWEFN7sD5wVCIjvOfEzFYF
 RCj4ZDTeQeJzEjn2PhHyKej4sy6+eOOAm+SrHH57zSOkoaG/NLUAsHbi0rGNSaxHNHV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5D3+4vJF30PnckXaBwwWrlTwdIUWKxzS4vTsfPc8j0o=; b=U2bj+Us8ExZU6OLmI4HuFvAqcD
 W4wtg10zoCuAN86trXWvZQRkgTa5eJ8qazztFKJCLRI8fVeIeWoGsjSDYjwxYb4clriMQd4SnKck1
 XXTF+NLEkfo0H9mr48iHIS4BmjW5MgfFq1UXUfEm8/QJwdrLQJa8varTpWXEDoeav8Zk=;
Received: from mail-lj1-f180.google.com ([209.85.208.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mlJ32-00AAcs-Al
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Nov 2021 23:00:10 +0000
Received: by mail-lj1-f180.google.com with SMTP id 207so14834312ljf.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Nov 2021 15:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5D3+4vJF30PnckXaBwwWrlTwdIUWKxzS4vTsfPc8j0o=;
 b=J6EayESLNmMLm+bc+qFM6+QK9dseJHiwJiSt9baF/ify2YbXjSf8dA5d0PAANCtBOZ
 EKqoZTX9ZI6RNKYH8gkWuUOhT/cy1q7QHkV821rFCovm5m0SsE4H9JuMCKZB8LyK+6Tm
 P17xBqI21hEG9tIWnia3OVm/bzGh88eGB1qg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5D3+4vJF30PnckXaBwwWrlTwdIUWKxzS4vTsfPc8j0o=;
 b=jtLSEhd4OjToXd/iAH0ZCZ7hbW4fnQEG2U0U7zNauQEOVtp/tiMrH30ilgj7sdClOw
 7jXYo/rjN0so2nQMcXzXb50JGSFgS1l6ooiWBJDhSvmi97CFM9tihaQEcGHVFgjQ2uYX
 bfNN24Cmx154h03Dmw/t+9F7LUyIkicwB61EuPNd3tFTmA6W/OlSmZuxcPeIkGH9u1Td
 iZ/sibZJ2N2I+k2YoXKGHS/md2ND/lEKGnYVhal91aH/EbnQZRMCWsilduqTpIjILq5n
 sJa8+LCWhP/+teFVLso9S3gAMUBDHMQLUp0naWccrrbqmLKJ4jVHtkwRQ0toX3dLTD4e
 R4zQ==
X-Gm-Message-State: AOAM533ES4MI1v0PrgHYMGNOBS9453QITDS6t8blKjVYrJJnihaFD7AL
 XOKfpk2J6DzL+9dCV5whrQtSP25FY0zEmEKu
X-Google-Smtp-Source: ABdhPJxBfkxmJg7mvDwPNeVGxzQLZOFzPHpgffQNvwlqbczHHguOgokCULVuv+s3BV/p1K/OwNJSMQ==
X-Received: by 2002:a2e:8895:: with SMTP id k21mr10881244lji.331.1636671593594; 
 Thu, 11 Nov 2021 14:59:53 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id g10sm398982lfv.113.2021.11.11.14.59.52
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 14:59:52 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id 13so14856747ljj.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Nov 2021 14:59:52 -0800 (PST)
X-Received: by 2002:a2e:530b:: with SMTP id h11mr10485841ljb.95.1636671592076; 
 Thu, 11 Nov 2021 14:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20211109013058.22224-1-nickrterrell@gmail.com>
 <471E6457-AF14-4E84-9197-BF30C3DCFFEB@fb.com>
In-Reply-To: <471E6457-AF14-4E84-9197-BF30C3DCFFEB@fb.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 11 Nov 2021 14:59:36 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg3Bqbn=V5kbd-5Rz9xzC_hNyOpNLPPTavZ1Zhdz1dt=w@mail.gmail.com>
Message-ID: <CAHk-=wg3Bqbn=V5kbd-5Rz9xzC_hNyOpNLPPTavZ1Zhdz1dt=w@mail.gmail.com>
To: Nick Terrell <terrelln@fb.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Nov 10, 2021 at 10:47 AM Nick Terrell <terrelln@fb.com>
    wrote: > > I just wanted to make sure that you’ve received my pull request.
    I’m a newbie > here, so I want to make sure I’m not ma [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.180 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.180 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                             mail domains are different
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1mlJ32-00AAcs-Al
Subject: Re: [f2fs-dev] [GIT PULL] zstd changes for v5.16
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
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>,
 LKML <linux-kernel@vger.kernel.org>, Tom Seewald <tseewald@gmail.com>,
 Chris Mason <clm@fb.com>, Jean-Denis Girard <jd.girard@sysnux.pf>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Paul Jones <paul@pauljones.id.au>,
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 Christoph Hellwig <hch@infradead.org>, Kernel Team <Kernel-team@fb.com>,
 Eric Biggers <ebiggers@kernel.org>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Sedat Dilek <sedat.dilek@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 David Sterba <dsterba@suse.cz>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Petr Malat <oss@malat.biz>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Felix Handte <felixh@fb.com>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBOb3YgMTAsIDIwMjEgYXQgMTA6NDcgQU0gTmljayBUZXJyZWxsIDx0ZXJyZWxsbkBm
Yi5jb20+IHdyb3RlOgo+Cj4gSSBqdXN0IHdhbnRlZCB0byBtYWtlIHN1cmUgdGhhdCB5b3XigJl2
ZSByZWNlaXZlZCBteSBwdWxsIHJlcXVlc3QuIEnigJltIGEgbmV3YmllCj4gaGVyZSwgc28gSSB3
YW50IHRvIG1ha2Ugc3VyZSBJ4oCZbSBub3QgbWFraW5nIGEgc3R1cGlkIG1pc3Rha2UgdGhhdCBt
ZWFucyB5b3XigJl2ZQo+IG1pc3NlZCBteSBtZXNzYWdlLiBJ4oCZZCBoYXRlIGZvciB0aGlzIFBS
IHRvIG5vdCBldmVuIGJlIGNvbnNpZGVyZWQgZm9yIG1lcmdpbmcKPiBpbiB0aGlzIHdpbmRvdyBi
ZWNhdXNlIG9mIHNvbWUgbWlzdGFrZSBJ4oCZdmUgbWFkZS4KCk9oLCBpdCdzIGluIG15IHF1ZXVl
LCBidXQgaXQncyBiYXNpY2FsbHkgYXQgdGhlIGVuZCBvZiBteSBxdWV1ZQpiZWNhdXNlIEkgd2ls
bCBuZWVkIHRvIHRha2UgYSBtdWNoIGRlZXBlciBsb29rIGludG8gd2hhdCdzIGdvaW5nIG9uLgoK
SXQncyBub3QganVzdCB0aGF0IHlvdSdyZSBhIG5ldyBzb3VyY2Ugb2YgcHVsbHMsIGl0J3MgYWxz
byB0aGF0IHRoaXMKaXMgYSBiaWcgY2hhbmdlIGFuZCBjb21wbGV0ZWx5IGNoYW5nZXMgdGhlIG9y
Z2FuaXphdGlvbiBvZiB0aGUgemxpYgpzdHVmZi4gU28gZXZlcnkgdGltZSBJIGxvb2sgYXQgbXkg
bGlzdCBvZiBwZW5kaW5nIHB1bGxzLCB0aGlzIGFsd2F5cwplbmRzIHVwIGJlaW5nICJJJ2xsIGRv
IGFsbCB0aGUgbm9ybWFsIG9uZXMgZmlyc3QiLgoKU28gaXQncyBub3QgbG9zdCwgYnV0IHRoaXMg
aXMgdGhlIGtpbmQgb2YgcHVsbCB0aGF0IEkgdGVuZCB0byBkbyB3aGVuCm15IHF1ZXVlcyBoYXZl
IGVtcHRpZWQuIFdoaWNoIHRoZXkgaGF2ZW4ndCBkb25lIHlldC4uCgogICAgICAgICAgICAgICBM
aW51cwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
