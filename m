Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F29B064A373
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Dec 2022 15:34:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4jtI-0003rk-6p;
	Mon, 12 Dec 2022 14:34:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p4jtH-0003re-8d
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 14:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s0lMPKvoZPKdNRFDmBzg6bKHelf3OCwkL92ErR9hBd4=; b=MQO1vtLsHppyd8mghg5bLTjkjz
 jITV01RIKAHZ1aF4CjaCtNjLxcA0AFDxTCuUpBtCFf2fBWx6Me9aXlkvaExFGmqBPYTSgrDBBRIrt
 scRsz8pzHXBSlNrXeKVuywwBURi9V9IfY+SCy99qz+q3SUPTwQXQhug9KGRnr9qdb9Yo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s0lMPKvoZPKdNRFDmBzg6bKHelf3OCwkL92ErR9hBd4=; b=hbwo/qtGksQSjnKUZdyYi0xCut
 hLfwQzSFe7u5UYNB/zRJOwr4uSXYbihqYCgKwbnR61AbmPFFTQXmjLTYBdqk3+uQp2lQvHJqJ/y6V
 OTMGd/T/rWzbgWhCglyv5kqMz9oot9PZ1iKL0iylAG7tDfeVPlwaWMMmQc0tsYuFPX/E=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4jtG-00Eont-IM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 14:34:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7783BB80D86;
 Mon, 12 Dec 2022 14:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8C0C433EF;
 Mon, 12 Dec 2022 14:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670855678;
 bh=xrxm9027GcAIsmiBgBtStkdcOzlrTaOUqUnQjxV8w2w=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=ooNgKFhMxlQUDD+qy9kGKVKk6EFT5vIYTPXu/+sFDk9QdepzsYhH63GADMkqI4IjI
 cRo5w4eVWI1WMIbCAYKkQsBIfcJwl+CZRdK5RyXwJ6wekmui1xFTbxWooZml0JoeC2
 7AP2vVidjIN1TQkYdZgM8fjuzVLfz44adSIzp36xClC5DWHW23W9thQs5QF4jgKQXZ
 PSgtUPfxg70CFmhxXwqkARDDjHmJhywXoqZyI9b+Cg7ENNglZNGUdQgFfez0v/dQOd
 HdeN9h8oOMKy+uKgJTiukHpA2kexpUHcJgVLuZkbgPXWE0MlNHGYuALDZoI46ksDkT
 YOZEXUPKsS4kA==
Message-ID: <2f100a4a-592d-f098-b204-efeef58341ee@kernel.org>
Date: Mon, 12 Dec 2022 22:34:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <974f5013-b6af-a39e-0b0f-2ce86253eaeb@kernel.org>
 <20221212141429.6329-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221212141429.6329-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/12 22:14, Yangtao Li wrote: > Hi Chao, > >> The
 difference here is,
 if we use f2fs_realtime_discard_enable() in >> f2fs_put_super(), 
 we will only write checkpoint w/ CP_TRIMMED flag >> when [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4jtG-00Eont-IM
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: don't call
 f2fs_issue_discard_timeout() when discard_cmd_cnt is 0 in f2fs_put_super()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/12/12 22:14, Yangtao Li wrote:
> Hi Chao,
> 
>> The difference here is, if we use f2fs_realtime_discard_enable() in
>> f2fs_put_super(), we will only write checkpoint w/ CP_TRIMMED flag
>> when discard option is enable and device supports discard.
> 
>> But actually, if discard option is disabled, we still needs to give
>> put_super() a chance to write checkpoint w/ CP_TRIMMED flag.
> 
> Why do we still have to set the CP_TRIMMED flag when the discard opt is not set.
> Did I miss something?

Hi Yangtao,

I guess it's up to scenario. e.g.

mount w/ nodiscard and use FITRIM to trigger in-batch discard,
if we set CP_TRIMMED flag during umount, next time, after mount
w/ discard, it doesn't to issue redundant discard.

Thanks,

> 
> Thx,
> Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
