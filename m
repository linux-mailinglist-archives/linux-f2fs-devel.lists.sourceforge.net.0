Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D121780A2A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  4 Aug 2019 11:42:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huD22-0001Id-2H; Sun, 04 Aug 2019 09:42:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1huD20-0001I4-Kj
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 04 Aug 2019 09:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:To:Subject:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mhd+TPejH0ZwuzLBF+zhD6S+XogKMOYxxWKzTVUdGYY=; b=FsZk804A8ZOn+9rY2bxPhnSl04
 MCSbzI2SjCQ2b1AoxEizDLVfe0TpH0d6oR/Fm1JBqKnppJWSLExcbu9HcGJDKUFlc4/9jjmMEXuHX
 SVBYwUwoxJX8aWDiDPZrHVqeJYpSebBgxkcAVuWqrzS7I3Nrok9al5ULCIJ3lY2Tly98=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:To:Subject:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mhd+TPejH0ZwuzLBF+zhD6S+XogKMOYxxWKzTVUdGYY=; b=Twb1LrJzAeR2+bkJmghzkO2d/U
 BUYNtD1/IZW+D5dNrULD6LAGk54kH5SFt0jDHgvDJrYdQ95gIVFQQDj8oMuRDGGQeQoYTljc/AWjZ
 ukAtoBRNKDyMSV8SPm5FRTodFycPjmYbtecMIlwVGEC2Lz03Dt6dUXkgQ4lVVVA8binc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huD1z-009vxb-3D
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 04 Aug 2019 09:42:24 +0000
Received: from [192.168.0.101] (unknown [180.111.32.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A5C02070D;
 Sun,  4 Aug 2019 09:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564911736;
 bh=eHZ3LbVmL56YmqVlqrvOvSSJqzheWzSMhiY9l05NP2o=;
 h=From:Subject:To:References:Date:In-Reply-To:From;
 b=cLRH8T6ZTkrZK5qS1nnzFT8DjeL2x+uywKyjzjXJH2irPLsvRPe4dqQc6Tk1XuxHC
 6Y7KEfgh9+Y+tAVpgnfmZoe7NCQJeOKo/g4Y1DJ1F/afQry2WGDSwmae1pj6bLGNCO
 QJsggE08iTcD2KYJ7TcVNyDvJjt5HHfWLe/X0wDI=
From: Chao Yu <chao@kernel.org>
To: Chao Yu <yuchao0@huawei.com>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 linux-api@vger.kernel.org, linux-crypto@vger.kernel.org,
 keyrings@vger.kernel.org, Paul Crowley <paulcrowley@google.com>,
 Satya Tangirala <satyat@google.com>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-15-ebiggers@kernel.org>
 <e3cf53a7-faf2-0321-22de-07d2e2783752@huawei.com>
 <20190802173148.GA51937@gmail.com>
Message-ID: <88479efb-6625-8778-f802-e159ec60a374@kernel.org>
Date: Sun, 4 Aug 2019 17:42:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190802173148.GA51937@gmail.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1huD1z-009vxb-3D
Subject: [f2fs-dev]  [PATCH v7 14/16] f2fs: wire up new fscrypt ioctls
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

On 2019-8-3 1:31, Eric Biggers wrote:
> On Fri, Aug 02, 2019 at 04:10:15PM +0800, Chao Yu wrote:
>> Hi Eric,
>>
>> On 2019/7/27 6:41, Eric Biggers wrote:
>>> From: Eric Biggers <ebiggers@google.com>
>>>
>>> Wire up the new ioctls for adding and removing fscrypt keys to/from the
>>> filesystem, and the new ioctl for retrieving v2 encryption policies.
>>>
>>> FS_IOC_REMOVE_ENCRYPTION_KEY also required making f2fs_drop_inode() call
>>> fscrypt_drop_inode().
>>>
>>> For more details see Documentation/filesystems/fscrypt.rst and the
>>> fscrypt patches that added the implementation of these ioctls.
>>>
>>> Signed-off-by: Eric Biggers <ebiggers@google.com>
>>
>> Reviewed-by: Chao Yu <yuchao0@huawei.com>
>>
>> BTW, do you think it needs to make xxfs_has_support_encrypt() function be a
>> common interface defined in struct fscrypt_operations, as I see all
>> fscrypt_ioctl_*() needs to check with it, tho such cleanup is minor...
>>
> 
> Maybe.  It would work nicely for ext4 and f2fs, but ubifs does things
> differently since it automatically enables the encryption feature if needed.
> So we'd have to make the callback optional.

Correct, ubifs can leave the callback as NULL function pointer.

> 
> In any case, I think this should be separate from this patchset.

Yup, it can be done in a separated patch if need.

Thanks,

> 
> - Eric
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
