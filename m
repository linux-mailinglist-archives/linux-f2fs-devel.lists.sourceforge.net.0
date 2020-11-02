Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EFF2A2844
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Nov 2020 11:30:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZX6n-0006ni-4z; Mon, 02 Nov 2020 10:30:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <kitestramuort@autistici.org>) id 1kZX6j-0006nX-Ar
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 10:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CJgw7pUZwPT0nccRrd0zw72oXkzznhkXjQVn5YtLvrk=; b=Ak+KpulRRb88CRGzr3yFKwZb4c
 +TACrWDqUbUm9STiy9uk4IVEwIL/U0Z4+PFFd8LEaxQWPVLa+JHtKTSEaxi0OtpiuXDddQpVdlTK9
 LCEXi9Ge+hDGmLhpsQt/HMNcTO603XyUopNknW3DtJWc5/ntG4VPsJLRGLJOp8qOn3yE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CJgw7pUZwPT0nccRrd0zw72oXkzznhkXjQVn5YtLvrk=; b=XTYu2MMc0sw6NurhfifR3evfu3
 2/ARTN4qEC3pVBStNUqCpRRIzRIXSMm/kiWMz4mH6ovS84xaCkitpRYGIZQUV7fvQ15Z/MV3UqqvS
 CExVO7OLY6uIuPTv6l3s/ByY3Z8bMo52k3sCySEGBsXsgaW9IWYA4EGf9nO6zXeeWjZ4=;
Received: from latitanza.investici.org ([82.94.249.234])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZX6X-00GDPA-92
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 10:30:37 +0000
Received: from mx3.investici.org (unknown [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id 4CPq1L3ny2z8shH;
 Mon,  2 Nov 2020 10:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=autistici.org;
 s=stigmate; t=1604313014;
 bh=CJgw7pUZwPT0nccRrd0zw72oXkzznhkXjQVn5YtLvrk=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=nMErQhMVWt+/OW9rvbpgOwb4sl9p0tc+Gf1CpGCPl0KuRk9tUrCrDn9ZvsAEfcwph
 2ZVKWaVhfNuF+331sDdPfoGccJ3oJ63/wxcJEQHw80InXeSZnzpiA5JJxY+lb07xbd
 Su9s1kdljDf8JGvUldab1V5zmzRO2D0xa/l1FkkY=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234])
 (Authenticated sender: kitestramuort@autistici.org) by localhost (Postfix)
 with ESMTPSA id 4CPq1K14D2z8shC; 
 Mon,  2 Nov 2020 10:30:12 +0000 (UTC)
Message-ID: <4f066a8cbebf3e116adad52eafd65011d609e5dc.camel@autistici.org>
From: kitestramuort <kitestramuort@autistici.org>
To: Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 02 Nov 2020 11:30:07 +0100
In-Reply-To: <9c07a511-7318-3f2b-bc8a-be45feacbdf1@huawei.com>
References: <4c3d4693b7e60d6e87b6255986c9b21f42f58cf8.camel@autistici.org>
 <1c0ea7b6-73b5-9027-e67f-3dfff8e50855@huawei.com>
 <2a029c2ad9ae558adb5147be767329e542b20b50.camel@autistici.org>
 <ab249f17-0c0c-6a16-c38b-e0a702cd5223@huawei.com>
 <5d700f2a32e92ccef7e5925833c3893cc9bc0d2d.camel@autistici.org>
 <1433cdebc4d5b8c21dee3fddd1cc959ea82f6ab4.camel@autistici.org>
 <659d1796-82ef-b4dd-f933-1c1c0c19c31e@huawei.com>
 <af85cef0922ec28e4bc4171816c5816eb68927aa.camel@autistici.org>
 <9c07a511-7318-3f2b-bc8a-be45feacbdf1@huawei.com>
User-Agent: Evolution 3.38.1 
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [82.94.249.234 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kZX6X-00GDPA-92
Subject: Re: [f2fs-dev] Linux 5.10-rc1: F2FS-fs access invalid blkaddr
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 2020-11-02 at 18:20 +0800, Chao Yu wrote:
> > 
> > That fixes it. Thank you very much!
> 
> Thanks for the quick test. :)
> 
> If you don't mind, I will change tag from Reported-by to Reported-
> and-tested-by
> in the patch.
> 
> Thanks,


No problem, although I am only one small use case.

Thanks again

cheers



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
