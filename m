Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B001CA482
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 May 2020 08:52:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWwrv-0005ow-MZ; Fri, 08 May 2020 06:52:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jWwrt-0005og-UH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 06:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=snsveWT+yJB6VQ5fgjYi4vu754HWsLYGYs2/57IiIIs=; b=YS9DMKdzb7sHTOmS+CfHiTWYJ5
 jfN9uZs1t0MbDUwruJYkltMYQoEJCAw3izklRSYizdBSvsAaTTq6WmoPN/WysAjcj+eiwRsjzV6ea
 0xgVZoWFuMDkkGuHUeLx5DwqBhiRgnc6K6mQZBhbw3eDlr1XZX1mrLqSbiqrGn36FO5s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=snsveWT+yJB6VQ5fgjYi4vu754HWsLYGYs2/57IiIIs=; b=cRp6jN4RJ2cQpwtzL2xnqORy7G
 pePDRr+SsZ/5QRuy0K0l45Zg0zaycD2dGsnzLQzcPcZIoByRdmGLQal8C8fuo5P5xN7UXPmmCFbXe
 MyrU1nAbg7VF0Slo9zkfPmZoni6/yizdr1O27iEZPpea/8IPQfgwVvcy2WmaX+EQLqks=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWwrs-00C9gj-3x
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 06:52:21 +0000
Received: by mail-lj1-f193.google.com with SMTP id h4so501953ljg.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 07 May 2020 23:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=snsveWT+yJB6VQ5fgjYi4vu754HWsLYGYs2/57IiIIs=;
 b=THnNxIewCJV4MBQ49YK3xWX6brA2V105UMphDKN/uYq0/0CIK/y4l1fcWiHiQ8m6gc
 P+yfSZep8hKMPuXDcEdPhTvbDB8aH8Za4pekl33uteo/mKqWS8f/A32ttRRYoAGM4F0w
 Qn4JpFG/AjGgkZwx+p/EHQ3Il/JOvTGx/H3epo9E+UK6ZcJeNtYvCdAxmigl91gu73Ch
 pmkb5eGaOds2e9IT9MK6uJRgTHoGN5235d9j0yVCDp5bQGROvfbPe4Uokz22O7+cSObp
 rqmM2I5SqqFV07IgcpdJTbFJIscQr2z2J3nkIA0P3W6mdaxkQ4agZQlo2xew99k1Zjhq
 u56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=snsveWT+yJB6VQ5fgjYi4vu754HWsLYGYs2/57IiIIs=;
 b=aJuQLiqHnBaiYD6QZwJvFdfCEHtPA8T6f3/pexTeemaAE6LqG3hW9QoBetDNDxsBym
 tGUmyhoCYSqdPPsgWNab0kq1IK7Yj1CQY6LtPQgAFwVlikRZj47hdcMUaunGnhlSbzOD
 AD02mYrsSyih8722yn+e6ahIxGvpT4pyq38Velm0/LjUo6LIpSDazYk2QVmw70HK//xD
 I1tblvv1sRAe1UF8GuJCDf75CdWZpLt8Pit7urf4pzyiDvFH2BEb0E8/s3CAR9xxF98x
 6NVp855jMZF1xRpwHLA/5JqHQ5uBhhql3m/zppSaByBF9CCW9KUuVXZj/yt/AQL2INOX
 XXJw==
X-Gm-Message-State: AOAM530ZGa9Fx8J8TkRkWZSCKNvCni12w7/8PN8jKGPaqeXODxJ3XrI3
 G/D4ePFlBDoajuRMoXakdDtNCcoHGZV/eZfrMsvmb7cqeX4=
X-Google-Smtp-Source: ABdhPJxFvsxgr5OOUyQJFD7RtgZRdaymEEM49pe0hHmyFol7gUWYsHeqvu9yxLU8P+92BEGP+F20Y0NTXpyukJ1MZTQ=
X-Received: by 2002:a2e:361a:: with SMTP id d26mr657621lja.171.1588920726023; 
 Thu, 07 May 2020 23:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200508011603.54553-1-yuchao0@huawei.com>
 <CACOAw_xxS_Wf==KnD31f9AOMu+QUs3WacowsfcD6w4A9n2AkTg@mail.gmail.com>
 <0d41e29e-c601-e016-e471-aed184ca4a6a@huawei.com>
 <CACOAw_z39D=2GONkMaQX6pSi2z26nqCvBZwZK-M=n3_yc84+yg@mail.gmail.com>
 <2a241a80-2597-ef9e-62b5-cf2b8bdb33c4@huawei.com>
In-Reply-To: <2a241a80-2597-ef9e-62b5-cf2b8bdb33c4@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 8 May 2020 15:51:54 +0900
Message-ID: <CACOAw_xmar1vv6yFu0DNzNjXq6eqXiVU-uxqQGjs3dUEHBWf_g@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWwrs-00C9gj-3x
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix zstd data corruption
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

R3JlYXQsIHRoYW5rcyBmb3IgY2hlY2tpbmd+ISA6KQoKCjIwMjDrhYQgNeyblCA47J28ICjquIgp
IOyYpO2bhCAzOjQyLCBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+64uY7J20IOyekeyEsToK
Pgo+IE9uIDIwMjAvNS84IDExOjMwLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+IEkgYW0gYSBsaXR0
bGUgYml0IGNvbmZ1c2VkLgo+ID4KPiA+IEluIGNvbXByZXNzX2xvZz0yICg0IHBhZ2VzKSwKPiA+
Cj4gPiBFdmVyeSBjb21wcmVzc2lvbiBhbGdvcml0aG0gd2lsbCBzZXQgdGhlIGNjLT5ucl9jcGFn
ZXMgdG8gNSBwYWdlcyBsaWtlIGJlbG93Lgo+ID4KPiA+ICAgICAgICAgbWF4X2xlbiA9IENPTVBS
RVNTX0hFQURFUl9TSVpFICsgY2MtPmNsZW47Cj4gPiAgICAgICAgIGNjLT5ucl9jcGFnZXMgPSBE
SVZfUk9VTkRfVVAobWF4X2xlbiwgUEFHRV9TSVpFKTsKPiA+Cj4gPiAgICAgICAgIGNjLT5jcGFn
ZXMgPSBmMmZzX2t6YWxsb2Moc2JpLCBzaXplb2Yoc3RydWN0IHBhZ2UgKikgKgo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNjLT5ucl9jcGFnZXMsIEdGUF9OT0ZT
KTsKPiA+Cj4gPiBBbmQgY2FsbCBjb3BzLT5jb21wcmVzc19wYWdlcyhjYykgYW5kIHRoZSByZXR1
cm5lZCBsZW5ndGggb2YgdGhlIGNvbXByZXNzZWQgZGF0YSB3aWxsIGJlIHNldCB0byBjYy0+Y2xl
biBmb3IgZXZlcnkgY2FzZS4KPiA+IEFuZCBpZiB0aGUgY2MtPmNsZW4gaXMgbGFyZ2VyIHRoYW4g
bWF4X2xlbiwgd2Ugd2lsbCBnaXZlIHVwIGNvbXByZXNzaW9uLgo+ID4KPiA+ICAgICAgICAgcmV0
ID0gY29wcy0+Y29tcHJlc3NfcGFnZXMoY2MpOwo+ID4gICAgICAgICBpZiAocmV0KQo+ID4gICAg
ICAgICAgICAgICAgIGdvdG8gb3V0X3Z1bm1hcF9jYnVmOwo+ID4KPiA+ICAgICAgICAgbWF4X2xl
biA9IFBBR0VfU0laRSAqIChjYy0+Y2x1c3Rlcl9zaXplIC0gMSkgLSBDT01QUkVTU19IRUFERVJf
U0laRTsKPiA+Cj4gPiAgICAgICAgIGlmIChjYy0+Y2xlbiA+IG1heF9sZW4pIHsKPiA+ICAgICAg
ICAgICAgICAgICByZXQgPSAtRUFHQUlOOwo+ID4gICAgICAgICAgICAgICAgIGdvdG8gb3V0X3Z1
bm1hcF9jYnVmOwo+ID4gICAgICAgICB9Cj4gPgo+ID4gU28sIHdpdGggeW91ciBwYXRjaCwgd2Ug
d2lsbCBqdXN0IHVzZSAzIHBhZ2VzIGZvciBaU1REIGFuZCA1IHBhZ2VzIGZvciBMWk8gYW5kIExa
NCBub3cuCj4gPiBNeSBxdWVzdGlvbiB3YXMgd2hldGhlciBpdCBpcyBhbHNvIHBvc3NpYmxlIHRv
IGRlY3JlYXNlIHRoZSBjb21wcmVzc2lvbiBidWZmZXIgc2l6ZSBmb3IgTFpPIGFuZCBMWjQgdG8g
MyBwYWdlcyBsaWtlIFpTVEQgY2FzZS4KPiA+IEkgd2FzIGp1c3QgY3VyaW91cyBhYm91dCB0aGF0
LiA6KQo+IEkgZ3Vlc3Mgd2UgY2FuIGNoYW5nZSBMWjQgYXMgd2UgZGlkIGZvciBaU1REIGNhc2Us
IHNpbmNlIGl0IHN1cHBvcnRzIHBhcnRpYWxseQo+IGNvbXByZXNzaW9uOgo+Cj4gLSBsejRfY29t
cHJlc3NfcGFnZXMKPiAgLSBMWjRfY29tcHJlc3NfZGVmYXVsdAo+ICAgLSBMWjRfY29tcHJlc3Nf
ZmFzdAo+ICAgIC0gTFo0X2NvbXByZXNzX2Zhc3RfZXh0U3RhdGUKPiAgICAgaWYgKG1heE91dHB1
dFNpemUgPCBMWjRfQ09NUFJFU1NCT1VORChpbnB1dFNpemUpKQo+ICAgICAgLSBMWjRfY29tcHJl
c3NfZ2VuZXJpYyguLi4sIGxpbWl0ZWRPdXRwdXQsIC4uLikKPiAgICAgICAtIGlmIChvdXRwdXRM
aW1pdGVkICYmIGJvdW5kYXJ5X2NoZWNrX2NvbmRpdGlvbikgcmV0dXJuIDA7Cj4KPiBBbmQgZm9y
IExaTyBjYXNlLCBpdCBsb29rcyB3ZSBoYXZlIHRvIGtlZXAgdG8gYWxsb2NhdGUgNSBwYWdlcyBm
b3Igd29yc3QKPiBjb21wcmVzc2lvbiBjYXNlIGFzIGl0IGRvZXNuJ3Qgc3VwcG9ydCBwYXJ0aWFs
bHkgY29tcHJlc3Npb24gYXMgSSBjaGVja2VkLgo+Cj4gVGhhbmtzLAo+Cj4gPgo+ID4KPiA+IDIw
MjDrhYQgNeyblCA47J28ICjquIgpIOyYpOyghCAxMTo0OCwgQ2hhbyBZdSA8eXVjaGFvMEBodWF3
ZWkuY29tIDxtYWlsdG86eXVjaGFvMEBodWF3ZWkuY29tPj7ri5jsnbQg7J6R7ISxOgo+ID4KPiA+
ICAgICBIaSBEYWVobywKPiA+Cj4gPiAgICAgT24gMjAyMC81LzggOToyOCwgRGFlaG8gSmVvbmcg
d3JvdGU6Cj4gPiAgICAgPiBIaSBDaGFvLAo+ID4gICAgID4KPiA+ICAgICA+IElJVUMsIHlvdSBh
cmUgdHJ5aW5nIG5vdCB0byB1c2UgWlNURF9jb21wcmVzc0JvdW5kKCkgdG8gc2F2ZSB0aGUgbWVt
b3J5Cj4gPiAgICAgPiBzcGFjZS4gQW0gSSByaWdodD8KPiA+ICAgICA+Cj4gPiAgICAgPiBUaGVu
LCBob3cgYWJvdXQgTFo0X2NvbXByZXNzQm91bmQoKSBmb3IgTFo0IGFuZCBsem8xeF93b3JzdF9j
b21wcmVzcygpIGZvcgo+ID4gICAgID4gTFpPPwo+ID4KPiA+ICAgICBPb3BzLCBpdCBsb29rcyB0
aG9zZSBsaW1pdHMgd2VyZSB3cm9uZ2x5IHVzZWQuLi4KPiA+Cj4gPiAgICAgI2RlZmluZSBMWjRf
Q09NUFJFU1NCT1VORChpc2l6ZSkgICAgICAgIChcCj4gPiAgICAgICAgICAgICAodW5zaWduZWQg
aW50KShpc2l6ZSkgPiAodW5zaWduZWQgaW50KUxaNF9NQVhfSU5QVVRfU0laRSBcCj4gPiAgICAg
ICAgICAgICA/IDAgXAo+ID4gICAgICAgICAgICAgOiAoaXNpemUpICsgKChpc2l6ZSkvMjU1KSAr
IDE2KQo+ID4KPiA+ICAgICAjZGVmaW5lIGx6bzF4X3dvcnN0X2NvbXByZXNzKHgpICgoeCkgKyAo
KHgpIC8gMTYpICsgNjQgKyAzICsgMikKPiA+Cj4gPiAgICAgTmV3bHkgY2FsY3VsYXRlZCBib3Vu
ZGFyeSBzaXplIGlzIGxhcmdlciB0aGFuIHRhcmdldCBidWZmZXIgc2l6ZS4KPiA+Cj4gPiAgICAg
SG93ZXZlciBjb21tZW50cyBvbiBMWjRfY29tcHJlc3NfZGVmYXVsdCgpIHNhaWQ6Cj4gPgo+ID4g
ICAgIC4uLgo+ID4gICAgICAqIEBtYXhPdXRwdXRTaXplOiBmdWxsIG9yIHBhcnRpYWwgc2l6ZSBv
ZiBidWZmZXIgJ2Rlc3QnCj4gPiAgICAgICogICAgICB3aGljaCBtdXN0IGJlIGFscmVhZHkgYWxs
b2NhdGVkCj4gPiAgICAgLi4uCj4gPiAgICAgaW50IExaNF9jb21wcmVzc19kZWZhdWx0KGNvbnN0
IGNoYXIgKnNvdXJjZSwgY2hhciAqZGVzdCwgaW50IGlucHV0U2l6ZSwKPiA+ICAgICAgICAgICAg
IGludCBtYXhPdXRwdXRTaXplLCB2b2lkICp3cmttZW0pOwo+ID4KPiA+ICAgICBBbmQgQG91dF9s
ZW4gaW4gbHpvMXhfMV9jb21wcmVzcygpIHdhcyBwYXNzZWQgYXMgYW4gb3V0cHV0IHBhcmFtZXRl
ciB0bwo+ID4gICAgIHBhc3MgbGVuZ3RoIG9mIGRhdGEgdGhhdCBjb21wcmVzc29yIGNvbXByZXNz
ZWQgaW50byBAb3V0IGJ1ZmZlci4KPiA+Cj4gPiAgICAgTGV0IG1lIGtub3cgaWYgSSBtaXNzZWQg
c3RoLgo+ID4KPiA+ICAgICBUaGFubmtzLAo+ID4KPiA+ICAgICA+IENvdWxkIHdlIHNhdmUgbW9y
ZSBtZW1vcnkgc3BhY2UgZm9yIHRoZXNlIHR3byBjYXNlcyBsaWtlIFpTVEQ/Cj4gPiAgICAgPiBB
cyB5b3Uga25vdywgd2UgYXJlIHVzaW5nIDUgcGFnZXMgY29tcHJlc3Npb24gYnVmZmVyIGZvciBM
WjQgYW5kIExaTyBpbgo+ID4gICAgID4gY29tcHJlc3NfbG9nX3NpemU9MiwKPiA+ICAgICA+IGFu
ZCBpZiB0aGUgY29tcHJlc3NlZCBkYXRhIGRvZXNuJ3QgZml0IGluIDMgcGFnZXMsIGl0IHJldHVy
bnMgLUVBR0FJTiB0bwo+ID4gICAgID4gZ2l2ZSB1cCBjb21wcmVzc2luZyB0aGF0IG9uZS4KPiA+
ICAgICA+Cj4gPiAgICAgPiBUaGFua3MsCj4gPiAgICAgPgo+ID4gICAgID4gMjAyMOuFhCA17JuU
IDjsnbwgKOq4iCkg7Jik7KCEIDEwOjE3LCBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20gPG1h
aWx0bzp5dWNoYW8wQGh1YXdlaS5jb20+PuuLmOydtCDsnpHshLE6Cj4gPiAgICAgPgo+ID4gICAg
ID4+IER1cmluZyB6c3RkIGNvbXByZXNzaW9uLCBaU1REX2VuZFN0cmVhbSgpIG1heSByZXR1cm4g
bm9uLXplcm8gdmFsdWUKPiA+ICAgICA+PiBiZWNhdXNlIGRpc3RpbmF0aW9uIGJ1ZmZlciBpcyBm
dWxsLCBidXQgdGhlcmUgaXMgc3RpbGwgY29tcHJlc3NlZCBkYXRhCj4gPiAgICAgPj4gcmVtYWlu
ZWQgaW4gaW50ZXJtZWRpYXRlIGJ1ZmZlciwgaXQgbWVhbnMgdGhhdCB6c3RkIGFsZ29yaXRobSBj
YW4gbm90Cj4gPiAgICAgPj4gc2F2ZSBhdCBsYXN0IG9uZSBibG9jayBzcGFjZSwgbGV0J3MganVz
dCB3cml0ZWJhY2sgcmF3IGRhdGEgaW5zdGVhZCBvZgo+ID4gICAgID4+IGNvbXByZXNzZWQgb25l
LCB0aGlzIGNhbiBmaXggZGF0YSBjb3JydXB0aW9uIHdoZW4gZGVjb21wcmVzc2luZwo+ID4gICAg
ID4+IGluY29tcGxldGUgc3RvcmVkIGNvbXByZXNzaW9uIGRhdGEuCj4gPiAgICAgPj4KPiA+ICAg
ICA+PiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tIDxt
YWlsdG86ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPj4KPiA+ICAgICA+PiBTaWduZWQtb2ZmLWJ5OiBD
aGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20gPG1haWx0bzp5dWNoYW8wQGh1YXdlaS5jb20+Pgo+
ID4gICAgID4+IC0tLQo+ID4gICAgID4+ICBmcy9mMmZzL2NvbXByZXNzLmMgfCA3ICsrKysrKysK
PiA+ICAgICA+PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+ID4gICAgID4+Cj4g
PiAgICAgPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29tcHJlc3MuYyBiL2ZzL2YyZnMvY29tcHJl
c3MuYwo+ID4gICAgID4+IGluZGV4IGMyMmNjMGQzNzM2OS4uNWU0OTQ3MjUwMjYyIDEwMDY0NAo+
ID4gICAgID4+IC0tLSBhL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4gICAgID4+ICsrKyBiL2ZzL2Yy
ZnMvY29tcHJlc3MuYwo+ID4gICAgID4+IEBAIC0zNTgsNiArMzU4LDEzIEBAIHN0YXRpYyBpbnQg
enN0ZF9jb21wcmVzc19wYWdlcyhzdHJ1Y3QgY29tcHJlc3NfY3R4Cj4gPiAgICAgPj4gKmNjKQo+
ID4gICAgID4+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTzsKPiA+ICAgICA+PiAgICAgICAg
IH0KPiA+ICAgICA+Pgo+ID4gICAgID4+ICsgICAgICAgLyoKPiA+ICAgICA+PiArICAgICAgICAq
IHRoZXJlIGlzIGNvbXByZXNzZWQgZGF0YSByZW1haW5lZCBpbiBpbnRlcm1lZGlhdGUgYnVmZmVy
IGR1ZSB0bwo+ID4gICAgID4+ICsgICAgICAgICogbm8gbW9yZSBzcGFjZSBpbiBjYnVmLmNkYXRh
Cj4gPiAgICAgPj4gKyAgICAgICAgKi8KPiA+ICAgICA+PiArICAgICAgIGlmIChyZXQpCj4gPiAg
ICAgPj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUFHQUlOOwo+ID4gICAgID4+ICsKPiA+ICAg
ICA+PiAgICAgICAgIGNjLT5jbGVuID0gb3V0YnVmLnBvczsKPiA+ICAgICA+PiAgICAgICAgIHJl
dHVybiAwOwo+ID4gICAgID4+ICB9Cj4gPiAgICAgPj4gLS0KPiA+ICAgICA+PiAyLjE4LjAucmMx
Cj4gPiAgICAgPj4KPiA+ICAgICA+Pgo+ID4gICAgID4+Cj4gPiAgICAgPj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ICAgICA+PiBMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdAo+ID4gICAgID4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0IDxtYWlsdG86TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQ+Cj4gPiAgICAgPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo+ID4gICAgID4+Cj4gPiAgICAgPgo+ID4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
