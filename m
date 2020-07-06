Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3677E215444
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jul 2020 10:58:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsMxT-0001wS-8Y; Mon, 06 Jul 2020 08:58:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pahome.chen@mirlab.org>) id 1jsMxR-0001wH-Jw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 08:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TlVSlrpc28mGb9bgzTpy2/pislUJ5lS8bmF+HOUJ3jQ=; b=BNMCgNFDtGb3Rk8t+C7Dk5Vf7r
 4+B7O1vOUPolyyI6eXab0t3KLOLtEaUxobEnS3M3z9swOEuBRl1pxigMGBLJACDZuakyk1aW0dNCJ
 CxRIiMGEtU8X7w0uifPtW5DKSkuk8GOSRueZ62eXPVXapgiqD4lVaaJifB3g7TIU5qu4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TlVSlrpc28mGb9bgzTpy2/pislUJ5lS8bmF+HOUJ3jQ=; b=LWnu6X3mkK2NNDqW1N+/WnADhx
 N1V5e7yWWLszSHRtNR6gsHcuyXNxCoOZKDjG+6cr+l+CRw08MTSfablq5O/OmsqZYki96LBKTBjgu
 M71yhE8lfq9EtdbrNBUSDDVzGS54SaMY0BJDYy65iqrrUgO/pQDM6UbF2RgwpqcO8274=;
Received: from mail-ej1-f52.google.com ([209.85.218.52])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jsMxQ-00C6p3-DU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 08:58:37 +0000
Received: by mail-ej1-f52.google.com with SMTP id y10so41528548eje.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 06 Jul 2020 01:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mirlab-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TlVSlrpc28mGb9bgzTpy2/pislUJ5lS8bmF+HOUJ3jQ=;
 b=1J05fjSSZIpSzjMp9LHViAYSUPYUxQKj9JcLJJKWy3+zbJskXcjCC73p0713R0VtXM
 sCuWc8oaAk0mfn0SVdOrlg6G73rH998uekqRuosDO3FfEUy7Jf6Sqyp3GUJe0jJ3pZr4
 A0qeZ/HPupv47VYNtfzSXsnZr57VpjUFKP4JVJYnXzcirZK2Qi1qEtLb17CNHPxSpNkE
 YRHDQUK3SW7uPbW4pJN8HabW5H1qbUQPfISLCW59Rqc3sLUrP881N+DwF6nEgPHMwwIA
 /ZKZilWgvgYTnYWCaZqtvbjQge/8HGINyTWKHRs7d9brxISihwzrY0SoH8P72fmkQ3Oe
 6K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TlVSlrpc28mGb9bgzTpy2/pislUJ5lS8bmF+HOUJ3jQ=;
 b=OBVQH/sxYmBQgAtEpPBJEqc85mpHXFT/0CKRhQqhgZaFD0GiplJauAcOenYC6W4Hbz
 XRMqufNUusXsYaArh2W81x44PfkMe7zJXHeDPRsGa46k6Ao5HDHla9ttQ+jOcehNkRky
 foUwBt6mhCHupf5gy4rZWScMnh+cFvADzYI3LaLjkhRJi9sBs8nLlAW20kQii/qA5pC6
 M7Sfb0Vx2IgYBmPmWxyoQX0r6Je/75N14l5ZQytOz8b+hI1JVfwU86OhIFABBFcCqWd8
 nQFT8BcqbRqOrI20yB3S/h3anNR1MKXl29yU+rcNwrNI1QZckFVAh5+xO4n7PuCSRBpW
 yXrw==
X-Gm-Message-State: AOAM532vLB2dcK8apV7nOCLmYk4dFkVHbKixpfqMlpw2SM0fJorVO4ix
 6pxYn89WGKauSoWPkt/oe+4FOz89tj/mbnLcw4hHqg==
X-Google-Smtp-Source: ABdhPJxkhyj06RbNX61Ze34gNCxhN8tg7R9Sg7qyDejJpxqdRdk8VzBBEJJulQ8gbfGSI5Wn7AAYJ31mZL5kDgIfGbg=
X-Received: by 2002:a17:906:c096:: with SMTP id
 f22mr20185429ejz.159.1594025902700; 
 Mon, 06 Jul 2020 01:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAB3eZfvyo4OzN_odXsnvDO6E=YHTt4qe5CXqQUyG7Mrk+MhzaQ@mail.gmail.com>
 <0ea89e42-8ea7-5557-8717-26d2e6965104@huawei.com>
 <CAB3eZfsjaNxMK+0HqYNAQQgksgGZNOO7QAXoT_Lgqr1+mPss3w@mail.gmail.com>
 <a80be8b3-75d1-33c8-a4da-b4c336ae53be@huawei.com>
 <CAB3eZfuVcAz56N5Cb8+BEsdRtfLWxxd0O+=aY8+qFhFaiAZWLw@mail.gmail.com>
 <2b4fc09f-126c-9f33-9f56-4e72d51eb012@huawei.com>
In-Reply-To: <2b4fc09f-126c-9f33-9f56-4e72d51eb012@huawei.com>
From: lampahome <pahome.chen@mirlab.org>
Date: Mon, 6 Jul 2020 16:58:14 +0800
Message-ID: <CAB3eZfumC+gx2ccnhOqG7ZLx+6bd0VLuBOS6G2WNqz843vC_+A@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.218.52 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.52 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsMxQ-00C6p3-DU
Subject: Re: [f2fs-dev] Can I know if now is gc-ing or checkpointing?
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPiDmlrwgMjAyMOW5tDfmnIg25pelIOmAseS4gCDk
uIvljYg0OjUx5a+r6YGT77yaCj4KPiBPbiAyMDIwLzcvNiAxNjoxMSwgbGFtcGFob21lIHdyb3Rl
Ogo+ID4gQnJpZWYgcHJvY2VkdXJlczoKPiA+IHBhcnRlZCAvZGV2L3NkZDEgYXMgMTYwR0IgZGlz
awo+ID4gbWtmcyAtdCBmMmZzIC9kZXYvc2RkMQo+ID4gbW91bnQgL2Rldi9zZGQxIC9tbnQvZjJm
c2Rpcgo+ID4KPiA+IEkgdXNlIHNoZWxsIHNjcmlwdCB0byBjcmVhdGUgMjAgZmlvIGNvbmN1cnJl
bnRseSBhbmQgd2FpdCBmb3IgZmluaXNoLgo+ID4gZmlvIGNvbW1hbmQ6Cj4gPiBmaW8gLWJzPTRr
IC1pb2RlcHRoPTQgLXJ3PXdyaXRlIC1pb2VuZ2luZT1saWJhaW8gLW5hbWU9bXkgLWRpcmVjdD0w
Cj4KPiBXaHkgbm90IHVzaW5nIGRpcmVjdD0xIGNvbWJpbmluZyB3aXRoIGxpYmFpbz8gb3RoZXJ3
aXNlIGRhdGEgd2FzIG9ubHkKPiB3cml0dGVuIHRvIGNhY2hlLgo+ClNvIGRpcmVjdElPIGhlbHAg
cGVyZm9ybWFuY2U/Cgo+IEJlbG93IGluZm8gc2hvd3MgR0Mgb3IgQ1AgZGlkbid0IGFmZmVjdCB0
aGUgdGVzdCByZXN1bHQuCldoeT8gU28gdGhlIEdDIGFuZCBDUCB3b3JrcyBub3JtYWxseT8KQ291
bGQgeW91IHRlbGwgbWUgaW4gZGV0YWlsPyB0aGFua3MKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
