Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9268A43BD78
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Oct 2021 00:51:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfVI7-000241-13; Tue, 26 Oct 2021 22:51:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <krisman@collabora.com>) id 1mfVI5-00023n-2j
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 22:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bu5rRIr6IqHf1tNpTSeeJGy60wPlQTCiuNoAiQYMGY4=; b=YVncUPavg0Irc8ljET0zXuY4RH
 ht46cTRUZmTjvFHYRcpBYjSkzWs53rhUP66GqEwFCGA7InDFYhOgzIkM1wg1ezArV+67dozUISGbb
 v5paguvEe56X8EGsheHWweaNOFVdFgW9VCOcS99O8FhligZGNcBtH8b7fMx9igLqvTCc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bu5rRIr6IqHf1tNpTSeeJGy60wPlQTCiuNoAiQYMGY4=; b=GvcLT9RuVseCSLxZzvKGjjkqIZ
 SNbnBkHEBnIu2ZWVSwtY2i8KT1LHumDphZv/WJPXUs5FZy9Te8SyCPEDzlaynnGSbDcq8ScypcdRi
 wy0paMaJ9XKeB30D4EH1jVsQY8j/u7OrNbm7ItMaRI0SKaGAXCFdEf06tsU+oVACI69M=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mfVFo-0000EB-Mq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 22:51:33 +0000
Received: from localhost (unknown [IPv6:2804:14c:124:8a08::1002])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: krisman)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 14CAA1F43A4A;
 Tue, 26 Oct 2021 14:56:25 +0100 (BST)
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Christoph Hellwig <hch@lst.de>
Organization: Collabora
References: <20210915070006.954653-1-hch@lst.de>
 <20210915070006.954653-11-hch@lst.de> <87wnmipjrw.fsf@collabora.com>
 <20211012124904.GB9518@lst.de> <87sfx6papz.fsf@collabora.com>
 <20211026074509.GA594@lst.de>
Date: Tue, 26 Oct 2021 10:56:20 -0300
In-Reply-To: <20211026074509.GA594@lst.de> (Christoph Hellwig's message of
 "Tue, 26 Oct 2021 09:45:09 +0200")
Message-ID: <87mtmvevp7.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Headers-End: 1mfVFo-0000EB-Mq
Subject: Re: [f2fs-dev] [PATCH 10/11] unicode: Add utf8-data module
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
Cc: linux-fsdevel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-ext4@vger.kernel.org, Shreeya Patel <shreeya.patel@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Christoph Hellwig <hch@lst.de> writes:

> On Tue, Oct 12, 2021 at 11:40:56AM -0300, Gabriel Krisman Bertazi wrote:
>> > Does this fix it?
>> 
>> Yes, it does.
>> 
>> I  will fold this into the original patch and queue this series for 5.16.
>
> This series still doesn't seem to be queued up.

Hm, I'm keeping it here:

https://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git/log/?h=for-next_5.16

Sorry, but I'm not sure what is the process to get tracked by
linux-next.  I'm Cc'ing Stephen to hopefully help me figure it out.

Thanks,

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
