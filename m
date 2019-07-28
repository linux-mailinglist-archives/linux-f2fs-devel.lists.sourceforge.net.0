Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD84C77C8D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jul 2019 02:46:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hrXKG-0007ts-9A; Sun, 28 Jul 2019 00:46:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hrXKE-0007tk-SF
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jul 2019 00:46:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vHLe6Yifu5e92NfKH7mCrPjQ6Zxz64kTfMH6b8mvEqs=; b=mQXcrZlSeopvRwa4Rw4I9l7gzS
 EASYQIexpeK0piw+OI79PLdZwa6Y/t/Vx/78zA3iqj4MLJai8Xjh9ggTb7RJ9jvu1NNGudACi8tMp
 L8v9r2dTg5/y6Q7UBFLRClo1haJkBQomuCqTakWtsL/kk5bijpvhja02tOiaw3bbSFTU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vHLe6Yifu5e92NfKH7mCrPjQ6Zxz64kTfMH6b8mvEqs=; b=bmd0ENLknS+EakVLemQDLjT0cJ
 48pH580MJ8uaJ8VgZzSC64LjjdsC8N/GMQ+udiqoOfxz5M7tjPyknKTM6q1dxaNw6cPjsXGCIeZ7G
 3bGShViV4UE4htFhimKzXrc1qBUQVZfZaK+tT73G2i+BxDkoxX0IrsSz+fWEHYcJYv0g=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hrXKD-001QeB-Nk
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jul 2019 00:46:10 +0000
Received: from [192.168.0.101] (unknown [180.111.32.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B06A2086D;
 Sun, 28 Jul 2019 00:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564274764;
 bh=hsA8mSmdQowOsHRk9e/OVmaiCpd4e8KUxVDsMnzqcmM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=0fpJx0lhiOeLOAsoah0WBkaoCDA5/zd4qGBunNewqDCve1P+H+ZTiVjUYEvSWi7cH
 yqgyGp7/yrBQRuCVvN4YaEo5hPe1u371k1oVeh2rjQ3GDT0ha6jB6hQiRNQGPU8uIM
 D8oZofcCILnWY2Zn/Wcu55XjaUbnLnVPK8JyMp8w=
To: Daniel Rosenberg <drosen@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190723230529.251659-1-drosen@google.com>
 <20190723230529.251659-3-drosen@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <af60ce55-1a29-d8da-81e4-77c880f4a0d0@kernel.org>
Date: Sun, 28 Jul 2019 08:45:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190723230529.251659-3-drosen@google.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hrXKD-001QeB-Nk
Subject: Re: [f2fs-dev] [PATCH v4 2/3] f2fs: include charset encoding
 information in the superblock
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
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-7-24 7:05, Daniel Rosenberg via Linux-f2fs-devel wrote:
> Add charset encoding to f2fs to support casefolding. It is modeled after
> the same feature introduced in commit c83ad55eaa91 ("ext4: include charset
> encoding information in the superblock")
> 
> Currently this is not compatible with encryption, similar to the current
> ext4 imlpementation. This will change in the future.
> 
> From the ext4 patch:
> """
> The s_encoding field stores a magic number indicating the encoding
> format and version used globally by file and directory names in the
> filesystem.  The s_encoding_flags defines policies for using the charset
> encoding, like how to handle invalid sequences.  The magic number is
> mapped to the exact charset table, but the mapping is specific to ext4.
> Since we don't have any commitment to support old encodings, the only
> encoding I am supporting right now is utf8-12.1.0.
> 
> The current implementation prevents the user from enabling encoding and
> per-directory encryption on the same filesystem at the same time.  The
> incompatibility between these features lies in how we do efficient
> directory searches when we cannot be sure the encryption of the user
> provided fname will match the actual hash stored in the disk without
> decrypting every directory entry, because of normalization cases.  My
> quickest solution is to simply block the concurrent use of these
> features for now, and enable it later, once we have a better solution.
> """
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
