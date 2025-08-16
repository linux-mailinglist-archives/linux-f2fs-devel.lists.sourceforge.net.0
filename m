Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 878A2B28B47
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 Aug 2025 09:05:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkLo53QJtsj840ZIczqavkabea3OLc4v5s782sswWYA=; b=Dvgi8KpbQvKIxyV3CABn+tJsVZ
	1dTduraBcHcq+XQdbEvoVWYhkDhJW1B4MZcUzrx5cZ0csl7W54cY55Q2bevykb2yhTLoaebKaz1xw
	JNXLbeVl8oxfC9nF8InhpVzVqy1By8gBDmgTD/rQZsdvrhcSsEMznaDAtXdkGrtCR8CQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1unAzD-0007Mg-DS;
	Sat, 16 Aug 2025 07:05:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1unAzB-0007Ma-O8
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 Aug 2025 07:05:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O85Qjw1tb+RPdtyihOGDiuRqxcXOOZyRRhgYjf8JlWU=; b=asMFr6Myb7YOjj2ZNQS8BQ2MOO
 up4lDjBqCXmn6WqdrY7Tc1y3Dz0TfavFARBOUP8WIeAr5+7m2TfcIzKdxIWtdHkxgVl1TB/zsw6KS
 gL9kft1C4qHAfdX3IhVA0JjR6hn+P/VspDeJzo449FH92xsPl94E+XDYENYqIX4UvlWQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O85Qjw1tb+RPdtyihOGDiuRqxcXOOZyRRhgYjf8JlWU=; b=HrhuqybODI7Tx2+Vek5p5l1LL1
 KZviGvcOSNfSWlVWa5uVB2Sv4ZP8DIIW4B43Ddi06gg6oncQALkfTwVe1kSuDigP8GjgbD8y+tJ0/
 bTYBUG5GcI+wubamlobpW5R0Mm/EPTfHXYF4xc89KkzoS/xHSSpB//JDPQnvI8RJaCLw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1unAzB-0002fU-Ae for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 Aug 2025 07:05:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A3EA5A584AA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 16 Aug 2025 07:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443DDC4CEEF;
 Sat, 16 Aug 2025 07:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755327942;
 bh=hu35BagZj+Xff393XimS0+DUXx08BEHNx1DZd0VL3n8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=biWRzoO7D0f7WgMAcfNlal51qjai10RqQdLphxz+4Gy7ZbirG01y7L5VO/MgSGVxA
 B+vMEkwQBsJXFRg6cDGUvYsPxA8jtvZataFIynXXbTGaVGKHA9f1xYQ8bNa0E7C6hK
 2oRErCKELVTrFnusXfCKHHOV5kB0Z7UKuDw8oNDAk0tXs1zeM2LPrGwGVRc1NP+2Hd
 zAd3HAXr27W75JMW9GJDMv9pHO8qheRZT/K3GQ+GmfGZSAGAxzmI3L0ekKw+tSIXvf
 wdXSkoKVR7MGLMvNzhbz5+0sj6UxFfYdbR34c1l7sbgAFpomrzh/5YbSkiG0rheS2e
 fJnSyoPJIcS+Q==
Message-ID: <e7a7d935-a43e-434e-9fd7-ba145255d3f5@kernel.org>
Date: Sat, 16 Aug 2025 15:05:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250812235814.960924-1-jaegeuk@kernel.org>
 <aJy8KS3fLQ452d2r@google.com> <aJ9eTaqNwkQZtA8E@google.com>
Content-Language: en-US
In-Reply-To: <aJ9eTaqNwkQZtA8E@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/8/16 00:20, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > This patch introduces a proc entry to show the currently enrolled donation
 > files. > > - "File path" indicates a file. > - "Status" > a. [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1unAzB-0002fU-Ae
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: show the list of donation files
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/8/16 00:20, Jaegeuk Kim via Linux-f2fs-devel wrote:
> This patch introduces a proc entry to show the currently enrolled donation
> files.
> 
> - "File path" indicates a file.
> - "Status"
>   a. "Donated" means the file is registed in the donation list by
>      fadvise(offset, length, POSIX_FADV_NOREUSE)
>   b. "Evicted" means the donated pages were reclaimed.
> - "Offset (kb)" and "Length (kb) show the registered donation range.
> - "Cached pages (kb)" shows the amount of cached pages in the inode page cache.
> 
> For example,
> 
> Donation List
>   # of files  : 2
>   File path                                              Status     Offset (kb)     Length (kb)    Cached pages (kb)
> ---
>   /local/tmp/test2                                      Donated               0         1048576              2097152
>   /local/tmp/test                                       Evicted               0         1048576              1048576
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
