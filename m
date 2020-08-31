Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A95E0257399
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Aug 2020 08:16:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCd75-00025P-0i; Mon, 31 Aug 2020 06:16:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kCd73-00025H-Lc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 06:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wuyLaVxjSrwxIvkp2IxPqXWRy1wwNZaJjHQ7rDHE6R8=; b=Y9OWA3qo4645KTCMJ7dKH3BvjG
 DvibJbmkF6GVfPHqUkhHhqz0Be7+HNyp2SEMxjru8QFScv6GsBDt4aW5Rk7Y5u9AvRpxnIijJD8KF
 fUuLfHjtmSYIXGLcLxEJXdetqS32BWGzEnFNEeHp+P4NAx0AOC3SBzIYfYdmNvLslpfM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wuyLaVxjSrwxIvkp2IxPqXWRy1wwNZaJjHQ7rDHE6R8=; b=AwQYHMaTa9WOEJF1gYQJ9Kamkd
 /3G+JUiiKcRExsizUw3GaHhwh1MeZMlOhTc+gNP1/zCCPYuxqt1ESeZFdQtY07evkgaRuXzDxoyHz
 ugJn/W7z7RE5QcbGY26n3cyqQOgLwSyDHU9kN9wYN9M5dzvCIy15Fbm9Nv8sGGYC6qSk=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kCd70-007cZH-H2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 06:16:17 +0000
Received: by mail-lf1-f65.google.com with SMTP id y2so1461627lfy.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 30 Aug 2020 23:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wuyLaVxjSrwxIvkp2IxPqXWRy1wwNZaJjHQ7rDHE6R8=;
 b=kR3os/OT6BRC3L4oP5KzyDneUktr1nxy3/N2aC9ju5O2lvshW++Wcl5LxGRycxEpeC
 l3If0m77zrzQbBCI4EVMo0PS+1NLM0jmMcYsTppkdnW54fL7He9omjwKmewfTbtXiJIs
 PT6GzxtZhEGFRt+ubd7UhWXOjvc6BB2Iu+nUULUO63t5TGlodTPq8wPD254dgYiQ0XSB
 DQZiZr9/KOT9Nf1l2XJ8VnRUY3BO2BXgbDOfmCeDbSGZwDoDbFgSZ8p7EPem2SAB8wSd
 2TBffeRyosVALZSchjkcw5i5HxDGVz5v9J9R8cD/jPd87181TKcykcCwsBiWtz9xF+tI
 iNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wuyLaVxjSrwxIvkp2IxPqXWRy1wwNZaJjHQ7rDHE6R8=;
 b=c6gBOJAFDLFn+IqbNOiCVII+DpOpw5sQ3DdDKbvW94Iy8J3ah5dXC/dPhUbKAkT23D
 cS+w3EWJo8sqTaCPMeQpLhmcTCRXRf62BmEdG7IzHakdWudh+WvE5q4w5nYrlXr9rmCQ
 614iC3ILIQ5IOi4lctE1oFbR1uyg2IPqeS3doNBCIY2OEnuc+pvNskxhc6nifm/SvugJ
 UZQLZ9nayNREvfNwnF8SQ8jKPTWDzaduS+tvJsfxGyOGMGmx50vozpdaMcT4CIik0igy
 7HyCGBnrcTexHTL2PkrVNGZmoWMVecumbvYYLl3AV4mQQ8wnDtbvKlWT+xA5cbcIxcWs
 9+AA==
X-Gm-Message-State: AOAM530ar3cw3u8t5mGcM8JYxLvIW2iNVSwqHFxrc8KYfsbndSY0Y2ZQ
 0+IfpNLgE8tiQe+pdt0MZSghGAgOF6n6uELNjk9yfwsOPMA=
X-Google-Smtp-Source: ABdhPJwque8Uf6G9h305X1MrSAtiMEEesSqMfkEwVSYosOibUf4sinoMvSyLURLyrfTNH//+wKVo+dNJv+e/0S/9dR8=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr2900580lfh.140.1598854564567; 
 Sun, 30 Aug 2020 23:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200828054629.583577-1-daeho43@gmail.com>
 <61996dcd-6db1-13fc-8239-7e684f3ec49e@kernel.org>
 <CACOAw_wc29AROzFhcGyC73i_vYZC1NmHP60uQfP7X-j6y6=kSA@mail.gmail.com>
 <bd1a8ffa-83ff-b774-9bed-ed68025d0c7a@huawei.com>
 <CACOAw_y=O35_SFxdfsVER4+a+n-eE6f48NXF6CsAnj=Ms-dgkA@mail.gmail.com>
 <c4f58675-9df5-e3af-45fc-6fa924e3ee68@huawei.com>
 <CACOAw_wZFAyyt8qPCFd-LQKpMGa1moyOqSBpUnaeM0z2Y5Z+cA@mail.gmail.com>
 <78ffaf17-56a0-32bd-0bcf-212333b52f06@huawei.com>
In-Reply-To: <78ffaf17-56a0-32bd-0bcf-212333b52f06@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 31 Aug 2020 15:15:52 +0900
Message-ID: <CACOAw_xpVOaU1-zJXmNSc8kkxhqE5eMZFT0PwWxwNo4XwjRH0g@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kCd70-007cZH-H2
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent compressed file from being
 disabled after releasing cblocks
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

SSB0aGluayB0aGlzIHBhdGNoIGlzIGVub3VnaCBmb3Igbm93LgpJZiB5b3UgaGF2ZSBhbnl0aGlu
ZyBlbHNlIHdlIHNob3VsZCB0YWtlIGNhcmUsIHBsZWFzZSBsZXQgbWUga25vd34KCjIwMjDrhYQg
OOyblCAzMeydvCAo7JuUKSDsmKTtm4QgMzowOCwgQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29t
PuuLmOydtCDsnpHshLE6Cj4KPiBPbiAyMDIwLzgvMzEgMTE6NTUsIERhZWhvIEplb25nIHdyb3Rl
Ogo+ID4+IC0gb3BlbihPX1JEV1IpCj4gPj4gLSBpb2N0bChGU19JT0NfU0VURkxBR1MsIEYyRlNf
Q09NUFJfRkwpCj4gPj4gLSB3cml0ZSgpCj4gPj4gLSBpb2N0bChSRUxFQVNFX0NPTVBSRVNTX0JM
T0NLUykgLS0gaW5vZGUgaXMgaW1tdXRhYmxlIG5vdwo+ID4+IC0gaW9jdGwoRlNfSU9DX1NFVEZM
QUdTLCB+RjJGU19DT01QUl9GTCkgLS0gU2hvdWxkIHdlIGFsbG93IHRvIHVwZGF0ZSBpbW11dGFi
bGUgaW5vZGU/Cj4gPj4gYXMgd2Uga25vdywgbm9ybWFsbHksIGltbXV0YWJsZSBpbm9kZSBzaG91
bGQgZGVueSBvcGVuKE9fV1JPTkxZIG9yIE9fUkRXUikgYW5kIGxhdGVyIHVwZGF0ZS4KPiA+Pgo+
ID4KPiA+IEZvciB0aGlzIGNhc2UsIHdpdGggdGhpcyBwYXRjaCB3ZSdsbCByZXR1cm4gLUVJTlZB
TCBmb3IKPiA+IGlvY3RsKEZTX0lPQ19TRVRGTEFHUywgfkYyRlNfQ09NUFJfRkwpLgo+ID4gSSB0
aG91Z2h0IFJFU0VSVkVfQ09NUFJFU1NfQkxPQ0tTIGlvY3RsIGlzIGFsd2F5cyByZXF1aXJlZCB0
byBnZXQgdGhlCj4gPiBmaWxlIHRvIG5vcm1hbCBtb2RlIGFmdGVyIFJFTEVBU0VfQ09NUFJFU1Nf
QkxPQ0tTIGlzIGNhbGxlZC4KPgo+IFRoYXQncyBhbiBleGFtcGxlLCBhZnRlciBjb21wcmVzc2Vk
IGJsb2NrIHJlbGVhc2UsIHNob3VsZG4ndCB3ZSBkaXNhbGxvdyBvdGhlciBpb2N0bAo+IGludGVy
ZmFjZSB3aGljaCB1cGRhdGVzIGltbXV0YWJsZSBpbm9kZT8KPgo+ID4gLgo+ID4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
