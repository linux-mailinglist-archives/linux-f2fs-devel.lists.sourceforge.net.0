Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A33A2131DF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jul 2020 04:47:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jrBjC-00060v-U2; Fri, 03 Jul 2020 02:47:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jrBjB-00060o-BR
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jul 2020 02:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Eal33Mv8b1H/h4IftAYSAXGyqqz8yFRIB607WgFe1P4=; b=QHdLQdaDiugeKiFrOQNYXy89bZ
 2o1lRqnr9p85CAmk7SA7JnLPaWBG717WsuPYUKYwN4LzlL1QxEPJNZRFtYri7cgSvHGqHhTatF60H
 GP8wezp9dhb3bHyWc1HscyXiIvEzI/iXw7x1DmG4/tbmxT5PIwoj33Uyoqvtyrv41Buw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Eal33Mv8b1H/h4IftAYSAXGyqqz8yFRIB607WgFe1P4=; b=BHk28asCUVUlRgoV44lzPeCnek
 XsRcwdYng9kce0YZhhkCLDQEimw+1GxCCNEMFLInce4xGY7WM8tRBJdscJU6Ywo9APCZ40oMH/wWf
 lvV3kpQnhgYmtJoHbYcWME7fdR5xyrvWSujUVTtxOb97Jk0EvLKWQpux9q6XRBeWjU4E=;
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jrBjA-00BUUW-1m
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jul 2020 02:47:01 +0000
Received: by mail-lf1-f67.google.com with SMTP id m26so17500335lfo.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 02 Jul 2020 19:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Eal33Mv8b1H/h4IftAYSAXGyqqz8yFRIB607WgFe1P4=;
 b=pI+z1f36Cq7rcUpt/+uR6YAxQ0Rrrq5bCVA7x/F6qRq9FuoxiF7dVIdNmfNxG/NuK/
 7pO1GyYRHTYuMon4bTMfo08Um7Z1v5DdjHnV0+0kX/YQdqW1TgnDQuOUURedx8c6TJNL
 ZZGgOdc7wlHP4XflcFloSI0Emmpt/xJb9cSbVQ1o/MQ3RiTSC2EDYmBzUBuLWqIV+he+
 xk9F+I1Ezz9/yl4AsXtVllKw31EOIyZB59IkmsGUlh+kYjklxk/vespI5KnTedpZxz8c
 43qhZztO9kCK2yfwMeWDpTaDUaoQa1fu4XayteLrSAN4BOJ094xJaXD7LLWrOtTmT8Rn
 on5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Eal33Mv8b1H/h4IftAYSAXGyqqz8yFRIB607WgFe1P4=;
 b=FwKFt8yLSiojuG6Xo0v0GOQKJ4mwFWGuDWGb1BDzdEekloyi7ku7CmH5MjRnK8g2eU
 rrWmGhsGZLWUdkXZZagidgiTwJ1nQJSyXtqmv8TvsjvSma5YlqpHg1cnm9EPChLGjhhr
 Tuc6FIaOwBdDn6EsiHHCw5T0kPZdX+PWB8AerbvCItoIlw2uwkCn7xk95wEtNIitTuf2
 T2mKi10ZJntyQ6d01QV1tc23L6Sl/k+d57mXmn2Z2LD8MuUsJhEFEdC/fCDghttxndJi
 whyGlqk+zmQUZ6wgLQ0Ym9LMLSLYBZoQKZkRFJ1pO7sFnPFGwPeQhgGzLAHKTQ8h4RVg
 9kwQ==
X-Gm-Message-State: AOAM5338yWdkUGkvT+OkrGqTMHkis3264gfmZXI2k8S83cLjZKU6RS6A
 brU+j69hLzFfXzTd+KcCzEFuSSetRYR1YO6JUeM=
X-Google-Smtp-Source: ABdhPJxR7Ht4Go78RJHC6zfXuavNs1NoV6Dkbp2qL+5fBSUunnBEgiWyPdESePolhUBC8sTwBXwejJZDJrFxdBnUUXA=
X-Received: by 2002:ac2:5e29:: with SMTP id o9mr19691281lfg.196.1593744413398; 
 Thu, 02 Jul 2020 19:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200630005625.2405062-1-daeho43@gmail.com>
 <961072bb-4c8f-b01e-666d-1f5e35a8b76d@huawei.com>
 <CACOAw_wQx5wjdWDX_WFebNS42t=wBuSh_k7oQ4v7abBv80SZXw@mail.gmail.com>
 <9d1afacc-6033-2bae-d55d-909d50f1904b@huawei.com>
 <CACOAw_zFLgeoomdHhRmzYMtCocTugW5AVxb2wZnoRAC9+hR9Gw@mail.gmail.com>
 <ee97fa6e-33df-04f9-ec37-6b7d7b495acb@huawei.com>
In-Reply-To: <ee97fa6e-33df-04f9-ec37-6b7d7b495acb@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 3 Jul 2020 11:46:42 +0900
Message-ID: <CACOAw_y23emnXdmbUJT_QDdF42EGJ9p4-ZuC9caJBGTpLWbR=g@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jrBjA-00BUUW-1m
Subject: Re: [f2fs-dev] [PATCH] f2fs: add symbolic link to kobject in sysfs
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

R290IGl0LgoKVGhhbmtzfgoKMjAyMOuFhCA37JuUIDPsnbwgKOq4iCkg7Jik7KCEIDExOjAyLCBD
aGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+64uY7J20IOyekeyEsToKPgo+IE9uIDIwMjAvNy8x
IDIwOjEyLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+PiBPbiAyMDIwLzcvMSAxNTowNCwgRGFlaG8g
SmVvbmcgd3JvdGU6Cj4gPj4+IEFjdHVhbGx5LCBJIHdhbnQgdG8ga2VlcCB0aGUgbW91bnQgbnVt
YmVyIHJlbWFpbmluZyB0byB0aGUgc2FtZQo+ID4+PiBudW1iZXIsIGV2ZW4gaWYgaXQncyByZS1t
b3VudGVkLgo+ID4+Cj4gPj4gVGhlbiBvbmNlIHRoZXJlIGlzIGYyZnMgdW1vdW50ZXIsIHRoZSBv
cmRlciB3aWxsIGJlIGluY29ycmVjdC4uLgo+ID4KPiA+IEFjdHVhbGx5LCB3ZSBwcmVwYXJlZCB0
aGlzIHBhdGNoIGZvciBhIHN0cmljdGx5IGNvbnRyb2xsZWQgc3lzdGVtIGxpa2UKPiA+IEFuZHJv
aWQgdG8gZWFzaWx5IGFjY2VzcyB0aGUgc3lzZnMgbm9kZSBmb3IgYSBzcGVjaWZpYyBwYXJ0aXRp
b24gbGlrZQo+ID4gdXNlcmRhdGEgcGFydGl0aW9uIHVzaW5nIGEgc3BlY2lmaWMgbnVtYmVyLgo+
Cj4gSSdtIG5vdCBhZ2FpbnN0IEFuZHJvaWQgZGVmaW5lZCBpbnRlcmZhY2VzLCBqdXN0IGJlIGNv
bmZ1c2VkIGFib3V0IHRoZQo+IGJlaGF2aW9yIHRoYXQgZG9lcyBub3QgZnVsbHkgZG9jdW1lbnRl
ZCAoYXQgbGVhc3QsIHdlIHNob3VsZCBhZGQgdGhpcwo+IGludG8gZjJmcyBkb2MsIGFuZCBzcGVj
aWZ5IHRoaXMgaXMgYW5kcm9pZCBzcGVjaWZpZWQgaW50ZXJmYWNlKSwgc29tZXRoaW5nCj4gbGlr
ZSBvbmNlIG9uZSBtb3VudCBwb2ludCB3YXMgdW1vdW50ZWQsIHRoYXQgc2VxdWVudGlhbCBudW1i
ZXIgQHggaW4KPiAnbW91bnRfQHgiIGNvdWxkIGJlIHJldXNlZCBieSBsYXRlciBuZXdseSBtb3Vu
dGVkIHBvaW50LCBpdCBicmVha3MgdGhlCj4gZGVzY3JpcHRpb246ICJpbiB0aGUgb3JkZXIgb2Yg
bW91bnRpbmcgZmlsZXN5c3RlbSIuCj4KPiA+IEluIHRoaXMgc3lzdGVtLCB3ZSBkb24ndCB3b3Jy
eSBhYm91dCBhbm90aGVyIHVuZXhwZWN0ZWQgZjJmcyB1bW91bnRlcgo+ID4gaW50ZXJmZXJpbmcg
aW4gYmV0d2VlbiB1bm1vdW50aW5nIGFuZCBtb3VudGluZyBhIHBhcnRpdGlvbi4KPiA+Cj4gPiBX
aGVuIHdlIGFyZSB1bmRlciB0aGUgY29uZGl0aW9uIHRoYXQgd2UgY2FuIGtlZXAgdHJhY2sgb2Yg
aG93IG1hbnkKPiA+IHRpbWVzIHRoZSB1c2VyZGF0YSBwYXJ0aXRpb24gaGFzIGJlZW4gcmUtbW91
bnRlZCwgd2UgbWlnaHQgYXMgd2VsbCB1c2UKPiA+IHRoZSBvcmlnaW5hbCBwYXJ0aXRpb24gbmFt
ZSBsaWtlICIvc3lzL2ZzL2YyZnMvZG0tOSIuCj4gPiBUaGlzIGlzIGZvciB3aGVuIHdlIGNvdWxk
bid0IGRvIHRoYXQuCj4gPiAuCj4gPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
