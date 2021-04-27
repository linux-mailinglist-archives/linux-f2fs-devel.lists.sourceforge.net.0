Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 738D236C257
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Apr 2021 12:09:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lbKf0-0003Um-P7; Tue, 27 Apr 2021 10:09:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <shreeya.patel@collabora.com>) id 1lbKey-0003Ua-2m
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Apr 2021 10:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZaN9vMeEZox5P/HMHTULt+eqTww8w2Zv5/Kb6l0lGW8=; b=YVqXukJfkDXtyESY/2u1ORHG3Y
 +3g9MjV/vL6ePMjQPigEuVIF5Ly/ZHSO4du5bQimKDhEkRwZOmZfKyw0Di5B/x0aQIdzoGRbPGSfJ
 gs4+UCRfC0Qlts1dRL0kXQk5huCZhw6L0fw97MBwMGj27GVH6FStDfZl8El0eLNLVFt0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZaN9vMeEZox5P/HMHTULt+eqTww8w2Zv5/Kb6l0lGW8=; b=CFTxqamgQkY9UZWCFQccfknoKn
 cA+Eh5eFSjXi1zSPLRQ1zHhIeIkpH28EIahP95KiKXFEXtAZx+6dNmEJSzd5kzSDq5RL2uLt/342v
 4oplXhmcGg5bqAcu2IF8HBXy/Wb6CIbMkS7nF+REJ4dBWcWq7BzvqG8/rQapN72qajlQ=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lbKen-0007G6-OH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Apr 2021 10:09:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shreeya) with ESMTPSA id AA8EE1F425CB
To: Christoph Hellwig <hch@infradead.org>
References: <20210423205136.1015456-1-shreeya.patel@collabora.com>
 <20210423205136.1015456-5-shreeya.patel@collabora.com>
 <20210427062907.GA1564326@infradead.org>
From: Shreeya Patel <shreeya.patel@collabora.com>
Message-ID: <61d85255-d23e-7016-7fb5-7ab0a6b4b39f@collabora.com>
Date: Tue, 27 Apr 2021 15:39:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210427062907.GA1564326@infradead.org>
Content-Language: en-US
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lbKen-0007G6-OH
Subject: Re: [f2fs-dev] [PATCH v8 4/4] fs: unicode: Add utf8 module and a
 unicode layer
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
Cc: tytso@mit.edu, drosen@google.com, ebiggers@google.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, kernel@collabora.com, adilger.kernel@dilger.ca,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, andre.almeida@collabora.com,
 linux-ext4@vger.kernel.org, krisman@collabora.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 27/04/21 11:59 am, Christoph Hellwig wrote:
> On Sat, Apr 24, 2021 at 02:21:36AM +0530, Shreeya Patel wrote:
>> utf8data.h_shipped has a large database table which is an auto-generated
>> decodification trie for the unicode normalization functions.
>> We can avoid carrying this large table in the kernel unless it is required
>> by the filesystem during boot process.
>>
>> Hence, make UTF-8 encoding loadable by converting it into a module and
>> also add built-in UTF-8 support option for compiling it into the
>> kernel whenever required by the filesystem.
> The way this is implemement looks rather awkward.
>
> Given that the large memory usage is for a data table and not for code,
> why not treat is as a firmware blob and load it using request_firmware?


utf8 module not just has the data table but also has some kernel code.
The big part that we are trying to keep out of the kernel is a tree 
structure that gets traversed based on a key that is the file name.
This is done when issuing a lookup in the filesystem, which has to be 
very fast. So maybe it would not be so good to use request_firmware for
such a core feature.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
