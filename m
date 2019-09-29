Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0330C12D2
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Sep 2019 04:28:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r3f0QcuwL6afhhv1J5DIee+6imNvElgxz+01VuuupW0=; b=YnlU+kqVNccEKSgWlzIoCM4Hu
	HgpvQ4o1asG29inMbQGvHch5+oepsPjEHOLanwvmMx8qKcmavsswTiE9m5aCXSF16DMp56Md5fc3J
	uDL0a+3ggjkFskR0W/FLb65LFsgMujKYwIScjtaSURQb0A2EYAZfnQPFjAB3V5oLAG8XE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iEOwl-0004N9-Iz; Sun, 29 Sep 2019 02:28:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cgxu519@zoho.com.cn>) id 1iEOwj-0004N1-La
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 29 Sep 2019 02:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:References:In-Reply-To:Message-ID:Cc:To:Reply-To:From:Date:Sender:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=76f0kfaoIA9sKZnGb5E3QXpVIRaa4EpKQeCVHsmdSQk=; b=AcGS27gzZLgdw8xVN/CAzkHU4e
 Gav5VYPL6jHeGYlQiOjA0n6CHlgDcqh31+tk3c70osOR+63KEgS+DvCFeXIKGSxG4dXmHu/5wVLim
 yfuV26f7i6sM7D5tw+hX93A5uLUA4rYgS/RONUWLdjQwIaiM6wHaXiUQVULedxDzF/rk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
 In-Reply-To:Message-ID:Cc:To:Reply-To:From:Date:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=76f0kfaoIA9sKZnGb5E3QXpVIRaa4EpKQeCVHsmdSQk=; b=Q6R3rTq+Ip4lLs0ldBNTqmoNGv
 5VvpIpM8i3B4BAq4pRjdubC8wbjTM91ulK0X1q3dhPI6v0PF7GFYOnqqEv9qiOn6xbkbnSzQrBQjt
 UzuOGDGen/N8JTluDqQsBE7SFNiRF/NFtYhpJprRUw6wb2bFl6JZYTNl08eh4haBD8Cs=;
Received: from sender3-pp-o92.zoho.com.cn ([124.251.121.251])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1iEOwe-00ADg4-Bl
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 29 Sep 2019 02:28:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1569723153; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=K7GTXZ4z6Gqw29SzhyLJ7WZHnDaNI6j0Cuvs1J3/fMkrqfWFUj+b5TP4uWFbzX4D4Y/89xuGPHxP/VXwqMWCa0F45hHb0w+oviCWz526vk7wdWF+m/hJoFMJmCinQTY5hL1XOmrptkZxhE+GQSPICw6uW7tKOCW7B2ZIK6fek+A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1569723153;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To:ARC-Authentication-Results;
 bh=76f0kfaoIA9sKZnGb5E3QXpVIRaa4EpKQeCVHsmdSQk=; 
 b=Dx/Jah9HRQJA2hzz+uAzRNpICgQ0C/PK9vonzR8BvBKbrOriFEXlRXKWwlg8XDqwoe2NQa9JFMH7iugboKDALLK5j1MReyvWuNTJb4pU++X9wCbvSd2Un4XYnZPNdDLHEpZaukvMNo0Gez6k4q2u3N/8U+1y83ElW4QKdyiCygQ=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=zoho.com.cn;
 spf=pass  smtp.mailfrom=cgxu519@zoho.com.cn;
 dmarc=pass header.from=<cgxu519@zoho.com.cn> header.from=<cgxu519@zoho.com.cn>
Received: from mail.baihui.com by mx.zoho.com.cn
 with SMTP id 156972315220989.23029399256257;
 Sun, 29 Sep 2019 10:12:32 +0800 (CST)
Received: from  [218.18.229.179] by mail.zoho.com.cn
 with HTTP;Sun, 29 Sep 2019 10:12:32 +0800 (CST)
Date: Sun, 29 Sep 2019 10:12:32 +0800
To: "Chao Yu" <yuchao0@huawei.com>
Message-ID: <16d7aca774e.ccf8569922236.7108655280280712303@zoho.com.cn>
In-Reply-To: <0d773ecd-076e-54da-e952-8e6ad7894bb6@huawei.com>
References: <20190928014006.8243-1-cgxu519@zoho.com.cn>
 <0d773ecd-076e-54da-e952-8e6ad7894bb6@huawei.com>
MIME-Version: 1.0
X-Priority: Medium
User-Agent: ZohoCN Mail
X-Mailer: ZohoCN Mail
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [124.251.121.251 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [124.251.121.251 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iEOwe-00ADg4-Bl
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix a comment in f2fs_shrink_count()
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
From: admin via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: cgxu519@zoho.com.cn
Cc: jaegeuk <jaegeuk@kernel.org>,
 linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

IC0tLS0g5ZyoIOaYn+acn+aXpSwgMjAxOS0wOS0yOSAwODo1NjoyNSBDaGFvIFl1IDx5dWNoYW8w
QGh1YXdlaS5jb20+IOaSsOWGmSAtLS0tCiA+IEhpIENoZW5nZ3VhbmcsCiA+IAogPiBUaGFua3Mg
YSBsb3QgZm9yIHRoZSBwYXRjaCwgcHJldmlvdXNseSBJJ3ZlIHNlbnQgYSBwYXRjaCB0byBmaXgg
bW9zdAogPiBpbmNvbnNpc3RlbnQgY29tbWVudHMgaW5jbHVkaW5nIGJlbG93IG9uZSwgY291bGQg
eW91IGNoZWNrIHRoYXQ/CiA+IAogPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZz
LWRldmVsLzIwMTkwOTI3MTAyMzA1LjExNTg3LTEteXVjaGFvMEBodWF3ZWkuY29tL1QvI3UKID4g
CgpIaSBDaGFvLAoKU29ycnksIEkgZGlkbid0IG5vdGljZSB0aGF0IGJlZm9yZSwgIHBsZWFzZSBq
dXN0IGRyb3AgbXkgcGF0Y2guCgoKVGhhbmtzLCAKQ2hlbmdndWFuZwoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
