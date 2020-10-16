Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F400528FC64
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Oct 2020 04:24:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kTFQA-0006Uc-Q2; Fri, 16 Oct 2020 02:24:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kTFQ9-0006UK-BT
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Oct 2020 02:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tHQr2iuUUuKS6ZqLQFzBOpeZW+ePtyM/Tpt0/nOhWSg=; b=kzgWMhiuuVhHWBzI+VONl05Mio
 1B6teolny7+sUp7IzUvPZ4yVv/lsHU8cf611Mclmf4A7QdjTVyZ7pkrkI3q6h+gVmzZU0aqBy7UzX
 d4PXx+9EXsi4MCgKJedCmB+1uyRIDwvnCg/hSCSDCPXi0SfPmc51L4yoX2m7s4rUIslg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tHQr2iuUUuKS6ZqLQFzBOpeZW+ePtyM/Tpt0/nOhWSg=; b=eXnqs9A8jof9k4UjYxyEGcSjiH
 IB4/NexUwM52riIRzqbSugfao5Si1LkpIqHGF/j8IJzwDZJ+30XiBBG0BDnESxa7ilARGt0MayDNz
 ZKGsBYv7A6viZ/CaYkCoa2g5YxRwXSasMe9MBc02med34Yj1SF83au/G3mRNFOzj9r0s=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kTFPz-00HJb7-D5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Oct 2020 02:24:41 +0000
Received: by mail-lj1-f193.google.com with SMTP id x16so871178ljh.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Oct 2020 19:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tHQr2iuUUuKS6ZqLQFzBOpeZW+ePtyM/Tpt0/nOhWSg=;
 b=hPEuUDwLiIvi9stOqZSvKWqYrVJlDOmIRwXHdFp4t7OkJdBIpaw5LeV5s3oY7eiDFF
 d9BgKOjbsQRpTIHYAFjrhSvdSZnjFmju+QpnSDQ9Ygn0golCdMoQtL9YdYWAbcX/NIAH
 u+ziV6ohy7T8e47F5s1dGBcZxHQG54pqiYAn33ytUj5jHq4mF4UCz9GMb41bAUGkrP5D
 q8vZodnJYSJe1lB4i02B6uMPpsWbo9C6huV7wfBAHCL9zsc3JaRKuyN0vYY9VFqM6IL2
 LQYYo28x6y1n4sZjn8o/60OsQd5zflEafkDampFvVXppdK18F2jE2Rx4AvfMBZI6edBT
 Jr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tHQr2iuUUuKS6ZqLQFzBOpeZW+ePtyM/Tpt0/nOhWSg=;
 b=ThEKfvWKu/Kgrg1U5j6gCIteuciWNEqEerpfbH668ArmZahrmuzZaB5LnvBEkQVYvw
 kRtc/T9grtA1CmbfRgHgRmz3bC3t2v9XDbhkt6DgXjyqQrLtmYDb1BcK17ibwRtRMpG5
 pA61ejLp6ZHG4S9vT2TAsPVFK9+0pDPzUOHzU3DzP2ZiszvKQqu0UjS8o55LltejiVV1
 9S8WBEPq1ftgxubMHE18PLqoECnNDKQfvoBQ7l3wQlBYHCiZ8evgk+At8/jNTXXs9hTP
 pKU504tJwMNIPPUnvdX8l8a/bdSWdcDimmXz6KUjbwcHOGlaKLxP8hJFoLZkpdQKgEiR
 53tg==
X-Gm-Message-State: AOAM530Ebe1i5dV9Rvtv0QBJRPT8UuxE8Aa4qcJJPMj1Kc2CMFaVGKXA
 CTWxERIUL7O3wH318mwCSxpts10QaukdMxUuSTY=
X-Google-Smtp-Source: ABdhPJwDPLOrvRnXPi+NPgbt826KelE2x5kzV7+p59dS7vXsDBw3/HHPgHo3+3uzuQZnvtLipwyqV4PzeU/vCqDb+vw=
X-Received: by 2002:a2e:584e:: with SMTP id x14mr518341ljd.335.1602815057503; 
 Thu, 15 Oct 2020 19:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201013022429.454161-1-daeho43@gmail.com>
 <20201013022429.454161-2-daeho43@gmail.com>
 <20201013061150.GC1062@sol.localdomain>
 <CACOAw_y31yAu=AGAEqvyo2Ankt-ux80E6g6m_sWnz6LyUgBXSg@mail.gmail.com>
 <20201015040441.GA834@sol.localdomain>
In-Reply-To: <20201015040441.GA834@sol.localdomain>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 16 Oct 2020 11:24:06 +0900
Message-ID: <CACOAw_wNWw2bcZy5kg0hoo1GQhrst6bEe87Dp4Q_uR+p7ZBkyA@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kTFPz-00HJb7-D5
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add F2FS_IOC_SET_COMPRESS_OPTION
 ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBtbnRfd2FudF93cml0ZV9maWxlKCkgY2hlY2tzIGZvciB3cml0ZSBwZXJtaXNzaW9uIHRvIHRo
ZSBtb3VudCwgbm90IHRvIHRoZSBmaWxlLgo+Cj4gSSB0aGluayB0aGlzIGlvY3RsIHdhbnRzIHdo
YXQgZjJmc19zZWNfdHJpbV9maWxlKCkgZG9lczoKPgo+ICAgICAgICAgaWYgKCEoZmlscC0+Zl9t
b2RlICYgRk1PREVfV1JJVEUpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVCQURGOwo+Cj4g
ICAgICAgICBmaWxlX3N0YXJ0X3dyaXRlKGZpbHApOwo+ICAgICAgICAgaW5vZGVfbG9jayhpbm9k
ZSk7Cj4gICAgICAgICAuLi4KPiAgICAgICAgIGlub2RlX3VubG9jayhpbm9kZSk7Cj4gICAgICAg
ICBmaWxlX2VuZF93cml0ZShmaWxwKTsKPgo+Cj4gQWZ0ZXIgYWxsIHlvdSBzaG91bGRuJ3QgYmUg
YWJsZSB0byBjaGFuZ2UgdGhlIGNvbXByZXNzaW9uIG9wdGlvbnMgb2YgYSBmaWxlCj4gZ2l2ZW4g
b25seSByZWFkIGFjY2VzcyB0byBpdCwgcmlnaHQ/CgpZZXAsIHRoaXMgbG9va3MgbW9yZSBhY2N1
cmF0ZS4KCj4gV2VsbCwgYXMgSSBzYWlkLCBpX3dyaXRlY291bnQgPT0gMSBkb2Vzbid0IGd1YXJh
bnRlZSB0aGF0IG90aGVyIHRocmVhZHMgYXJlbid0Cj4gbW1hcCdpbmcgb3Igd3JpdGluZyB0byB0
aGUgZmlsZS4gIEl0IGp1c3QgZ3VhcmFudGVlcyB0aGF0IHRoZXJlIGFyZW4ndCBhbnkgb3RoZXIK
PiB3cml0YWJsZSBmaWxlIGRlc2NyaXB0b3JzLiAgKEFjdHVhbGx5LCBmaWxlIGRlc2NyaXB0aW9u
cy4pICBNdWx0aXBsZSB0aHJlYWRzIGNhbgo+IGJlIHVzaW5nIHRoZSBzYW1lIGZpbGUgZGVzY3Jp
cHRvciAob3IgdGhlIHNhbWUgZmlsZSBkZXNjcmlwdGlvbikgY29uY3VycmVudGx5LgoKWWVwLCBJ
IGFncmVlIHRoaXMgaXMgbm90IGEgcHJvcGVyIHdheS4gSSB0aGluayB3ZSBkb24ndCBuZWVkIHRo
aXMKY2hlY2sgaGVyZSwgYmVjYXVzZQpjb21wcmVzcyByb3V0aW5lIGRvZXNuJ3QgY29tcHJlc3Mg
YW55IGZpbGUgZGF0YSB3aGVuIGl0IGRldGVjdHMgdGhlCmZpbGUgaXMgbW1hcGVkCnVzaW5nIGYy
ZnNfaXNfbW1hcF9maWxlKCkuCgpUaGFua3N+CgoKMjAyMOuFhCAxMOyblCAxNeydvCAo66qpKSDs
mKTtm4QgMTowNCwgRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0BrZXJuZWwub3JnPuuLmOydtCDsnpHs
hLE6Cj4KPiBPbiBXZWQsIE9jdCAxNCwgMjAyMCBhdCAxMToyNzozMEFNICswOTAwLCBEYWVobyBK
ZW9uZyB3cm90ZToKPiA+ID4gZjJmc19yZWFkb25seSgpIGlzIHJlZHVuZGFudCB3aXRoIG1udF93
YW50X3dyaXRlX2ZpbGUoKS4KPiA+ID4KPiA+ID4gQWxzbywgc2hvdWxkbid0IHRoaXMgcmVxdWly
ZSBhIHdyaXRhYmxlIGZpbGUgZGVzY3JpcHRvcj8gIEFzLWlzLCB0aGlzIGlvY3RsIGNhbgo+ID4g
PiBiZSBjYWxsZWQgb24gYSBmaWxlIG93bmVkIGJ5IGFub3RoZXIgdXNlciwgYXMgbG9uZyBhcyB0
aGUgY2FsbGVyIGhhcyByZWFkCj4gPiA+IGFjY2Vzcy4KPiA+ID4KPiA+ID4gTm90ZTogaWYgeW91
IGNoYW5nZSB0aGlzIHRvIHJlcXVpcmUgYSB3cml0YWJsZSBmaWxlIGRlc2NyaXB0b3IsIHRoZW4K
PiA+ID4gZjJmc19yZWFkb25seSgpLCBtbnRfd2FudF93cml0ZV9maWxlKCksIGFuZCBJU19JTU1V
VEFCTEUoKSBhbGwgd291bGQgbm8gbG9uZ2VyCj4gPiA+IGJlIG5lZWRlZC4KPiA+Cj4gPiBJIGFn
cmVlIHRoYXQgZjJmc19yZWFkb25seSgpIGlzIHJlZHVuZGFudC4KPiA+IEJ1dCwgc29ycnksIEkg
ZG9uJ3QgZ2V0IHRoZSByZXN0LiBJIHRob3VnaHQgbW50X3dhbnRfd3JpdGVfZmlsZSgpIGlzIGEK
PiA+IHdheSB0byBjaGVjayB3aGV0aGVyIHRoZSBjYWxsZXIgaGFzIGEgcHJvcGVyIHdyaXRlIHBl
cm1pc3Npb24gb3Igbm90Lgo+ID4gSSB0aGluayBqdXN0IHVzaW5nIG1udF93YW50X3dyaXRlX2Zp
bGUoKSBpcyBlbm91Z2ggZm9yIHRoaXMgaW9jdGwuIEFtCj4gPiBJIG1pc3Npbmcgc29tZXRoaW5n
Pwo+Cj4gbW50X3dhbnRfd3JpdGVfZmlsZSgpIGNoZWNrcyBmb3Igd3JpdGUgcGVybWlzc2lvbiB0
byB0aGUgbW91bnQsIG5vdCB0byB0aGUgZmlsZS4KPgo+IEkgdGhpbmsgdGhpcyBpb2N0bCB3YW50
cyB3aGF0IGYyZnNfc2VjX3RyaW1fZmlsZSgpIGRvZXM6Cj4KPiAgICAgICAgIGlmICghKGZpbHAt
PmZfbW9kZSAmIEZNT0RFX1dSSVRFKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FQkFERjsK
Pgo+ICAgICAgICAgZmlsZV9zdGFydF93cml0ZShmaWxwKTsKPiAgICAgICAgIGlub2RlX2xvY2so
aW5vZGUpOwo+ICAgICAgICAgLi4uCj4gICAgICAgICBpbm9kZV91bmxvY2soaW5vZGUpOwo+ICAg
ICAgICAgZmlsZV9lbmRfd3JpdGUoZmlscCk7Cj4KPgo+IEFmdGVyIGFsbCB5b3Ugc2hvdWxkbid0
IGJlIGFibGUgdG8gY2hhbmdlIHRoZSBjb21wcmVzc2lvbiBvcHRpb25zIG9mIGEgZmlsZQo+IGdp
dmVuIG9ubHkgcmVhZCBhY2Nlc3MgdG8gaXQsIHJpZ2h0Pwo+Cj4gPiA+IEkgZG9uJ3QgdGhpbmsg
dGhlIGNoZWNrIGZvciBpX3dyaXRlY291bnQgPT0gMSBhY2NvbXBsaXNoZXMgYW55dGhpbmcgYmVj
YXVzZSBpdAo+ID4gPiBqdXN0IG1lYW5zIHRoZXJlIGFyZSBubyAqb3RoZXIqIHdyaXRhYmxlIGZp
bGUgZGVzY3JpcHRvcnMuICBJdCBkb2Vzbid0IG1lYW4gdGhhdAo+ID4gPiBzb21lIG90aGVyIHRo
cmVhZCBpc24ndCBjb25jdXJyZW50bHkgdHJ5aW5nIHRvIHdyaXRlIHRvIHRoaXMgc2FtZSBmaWxl
Cj4gPiA+IGRlc2NyaXB0b3IuICBTbyB0aGUgbG9jayBuZWVkcyB0byBiZSBlbm91Z2guICBJcyBp
dD8KPiA+Cj4gPiBUaGlzIGlzIHRvIGRldGVjdCBhbnkgcG9zc2liaWxpdHkgb2Ygb3RoZXIgdGhy
ZWFkcyBtbWFwLWluZyBhbmQKPiA+IHdyaXRpbmcgdGhlIGZpbGUuCj4gPiBVc2luZyBvbmx5IGlu
b2RlIGxvY2sgaXMgbm90IGVub3VnaCB0byBwcmV2ZW50IHRoZW0gZnJvbSBtYWtpbmcgZGlydHkg
cGFnZXMuCj4KPiBXZWxsLCBhcyBJIHNhaWQsIGlfd3JpdGVjb3VudCA9PSAxIGRvZXNuJ3QgZ3Vh
cmFudGVlIHRoYXQgb3RoZXIgdGhyZWFkcyBhcmVuJ3QKPiBtbWFwJ2luZyBvciB3cml0aW5nIHRv
IHRoZSBmaWxlLiAgSXQganVzdCBndWFyYW50ZWVzIHRoYXQgdGhlcmUgYXJlbid0IGFueSBvdGhl
cgo+IHdyaXRhYmxlIGZpbGUgZGVzY3JpcHRvcnMuICAoQWN0dWFsbHksIGZpbGUgZGVzY3JpcHRp
b25zLikgIE11bHRpcGxlIHRocmVhZHMgY2FuCj4gYmUgdXNpbmcgdGhlIHNhbWUgZmlsZSBkZXNj
cmlwdG9yIChvciB0aGUgc2FtZSBmaWxlIGRlc2NyaXB0aW9uKSBjb25jdXJyZW50bHkuCj4KPiAt
IEVyaWMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
