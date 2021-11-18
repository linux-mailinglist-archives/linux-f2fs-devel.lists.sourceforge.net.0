Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F2F4554E2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Nov 2021 07:48:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mnbDC-0001XL-Rk; Thu, 18 Nov 2021 06:47:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mnbDB-0001XE-F2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Nov 2021 06:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=huWInaL7AC7ZSQO7OY55iV0JSCQCuZYfx5W74wXBOuo=; b=JR4vaakPu3YnXo9Ui5YMs7/B12
 mCamZ4O1Rad2xCOiE4p2sqTesMgu5WCKdf2Od2b9ZrUNj1nC/8KTg0iRYC+Sug8h7KP+buUa5U/k+
 T7c393B0P5p4lBgJI9yXILPYTEB1tNrtU2y9nNFYRJW7RxdupE/cajS/B381dW52MsZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=huWInaL7AC7ZSQO7OY55iV0JSCQCuZYfx5W74wXBOuo=; b=WfoGQTNMWVuK4koPhEnfRTQt2f
 uTPCAY0gzUVBvurk637Ipt5UEz278h1nFUKHtriFErDndj4admwTVHSBcHond9ekD18GfvBXA1VhD
 jMzvaWSFqjPWs2RqVBhxIlJLQSJNbUfP11fiMQFi4spk6hC21GxY7F/FuQmNBht71dU8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mnbDB-00H92i-GL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Nov 2021 06:47:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA74761B2B;
 Thu, 18 Nov 2021 06:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637218071;
 bh=DJpzKUbCCipn2+BKNfoZijfmyxFp2BqYSAJ04JRQyOo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UZMqTr92EsMWd+v4oNLGRfL20jTxirfEjoX/eNdJHTzcP2+S6HOkNrPjLsg05ZW+e
 8PPhS1qZIQa2SvQTvYZ0ICPuWjlJohsHnxvMyBGfoWwiYizybzpY82Qtktjg2Bwxpb
 2+WG0GejXJCEBfCQvXPNtU4u7XJX9AhyJcmPyxa9QB9ipUjlUcUwcZflgT00eXWUa1
 AjExjXWgAm3ePhlZnqP1wbzbPye4EdgtEdHBvq4z/bEh5e2drXbRlrO5go52LT/Q92
 0XVi39AfZZHBoDDZ2kNVNH1MZ19t3JxvGvGkWNWHnVeCAvg5Cmy8P1MGBunES94KKf
 jL+BxZlhFa8Kw==
Message-ID: <8d4dc13b-a4a8-0b17-fe0b-f2e343be0083@kernel.org>
Date: Thu, 18 Nov 2021 14:47:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20211116214510.2934905-1-jaegeuk@kernel.org>
 <e9cad692-148b-2d4b-2017-fd0a2ebd2833@kernel.org>
 <YZVXtAFIGqOAYYVF@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YZVXtAFIGqOAYYVF@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/11/18 3:27,
 Jaegeuk Kim wrote: >> /* do not preallocate
 block which is partially written */ >> >> Otherwise, it looks good to me.
 > > Applied with this. > /* Do not preallocate blocks that wil [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mnbDB-00H92i-GL
Subject: Re: [f2fs-dev] [PATCH 1/6] f2fs: rework write preallocations
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
Cc: Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/11/18 3:27, Jaegeuk Kim wrote:
>> /* do not preallocate block which is partially written */
>>
>> Otherwise, it looks good to me.
> 
> Applied with this.
> /* Do not preallocate blocks that will be written partially in 4KB. */

Better. :)

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
