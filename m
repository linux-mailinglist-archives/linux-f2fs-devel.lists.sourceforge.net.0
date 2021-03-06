Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB7432FC87
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  6 Mar 2021 19:54:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lIc4e-0003O5-PN; Sat, 06 Mar 2021 18:54:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <me@beroal.in.ua>) id 1lIc4d-0003Ny-G1
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 06 Mar 2021 18:54:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tW6+hSvxBxT7dZ8qAWP4iWQTU2ga1qotXDQmrzhkX8Y=; b=fCtPjrky/omXJpbxkNWGgsjgUt
 0qjlPEx8iH6ErVm3iO3XxCTKv5IoI8++WAGH285/TGuv49o3vzNKAzQwteSjvYpWVj4Wykm5Kslay
 Cqi/i8z+P6LKAkPrAh6kEVq9Re/uarPKKngsKXgMBYCZ1U7yQQYztTQ5iiN4AJFvCTS0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:
 Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tW6+hSvxBxT7dZ8qAWP4iWQTU2ga1qotXDQmrzhkX8Y=; b=N
 Wl5VES798SCaLaNBEK3hmTfkNBd7eQDXwJ1XcGIl0yYYRGVFNK3N3nmssp6CFwiXzaciAMFeDjN/U
 o/2JX0wtRnFCn6EvDYCMHTdPBw/WdFQtlpifzd9mWUqu1EOPd08xY7Pu6UenvqQG/vAHOHw8YTudM
 RmSVEhwCWMf2tCO0=;
Received: from smtp-1.1gb.com.ua ([195.234.4.10] helo=u1.1gb.ua)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1lIc4U-0004A1-CH
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 06 Mar 2021 18:54:47 +0000
Received: from Spooler by u1.1gb.ua (Mercury/32 v4.52) ID MO006572;
 6 Mar 2021 20:54:38 +0200
Received: from spooler by mail-u1-robots.in-solve.hidden (Mercury/32 v4.52);
 6 Mar 2021 20:34:05 +0200
Received: from ul1.1gb.ua (195.234.4.24) by smtp-1.1gb.com.ua (Mercury/32
 v4.52) with ESMTP ID MG006571; 6 Mar 2021 20:34:03 +0200
Received: from [192.162.141.53] ([192.162.141.53]) (authenticated bits=0)
 by ul1.1gb.ua (8.14.9/8.14.9) with ESMTP id 126IY2ni002582
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
 for <linux-f2fs-devel@lists.sourceforge.net>; Sat, 6 Mar 2021 20:34:02 +0200
To: linux-f2fs-devel@lists.sourceforge.net
From: me@beroal.in.ua
Message-ID: <9894d09e-4e10-646a-0815-8e0f9f463486@beroal.in.ua>
Date: Sat, 6 Mar 2021 20:34:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Language: uk-UA
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.3 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1lIc4U-0004A1-CH
Subject: [f2fs-dev] bug in f2fs-tools
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi. Sorry if I am posting to an inappropriate mailing list. What is the 
proper place to report bugs in `f2fs-tools`?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
