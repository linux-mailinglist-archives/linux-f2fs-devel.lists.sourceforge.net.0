Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D784134DE1B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Mar 2021 04:17:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lR3wg-0000gY-5V; Tue, 30 Mar 2021 02:17:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1lR3we-0000gH-Ba
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Mar 2021 02:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0DuTcMrvHT9vAEEup19YxCembDHCmkKQdNv5VP6xKns=; b=lZ+IE/toHgC3EgkGbRarStfI0L
 2P0xE1v/vCqFkdu9H2FtJg83t2AvpDLh+2XHKf6xVq3NJ+LO8cNv6PpRYFkyuuYCXX7DukuyaBncO
 SKpPBC3bjUk5Nnhsc53xVaJuarU7Z+tz84a7xDvUlFYjCWl2mVeTJf7H3EiQFiQe9w/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0DuTcMrvHT9vAEEup19YxCembDHCmkKQdNv5VP6xKns=; b=R2OJnFzCl0r3HhSKlFAyiV/hAG
 cWoP2Sq4qVRR9e/IFEie2J+Gs8d5Bq3zkiw96yHKI1aZpgHSz5heAzFU+wTGeWNV2pgk0Vjx1BmIW
 7J4i6Sc4pf4+a3gpQvgaxjE9j+Ei69hGfte9abpn/RCOQi/lSq6fYzKY1LWAC+xm6tgA=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lR3wO-00B17I-KC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Mar 2021 02:17:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 3A9B61F451A2
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
Organization: Collabora
References: <20210329204240.359184-1-shreeya.patel@collabora.com>
 <20210329204240.359184-5-shreeya.patel@collabora.com>
 <YGKGhxaozX3ND6iB@gmail.com>
Date: Mon, 29 Mar 2021 22:16:57 -0400
In-Reply-To: <YGKGhxaozX3ND6iB@gmail.com> (Eric Biggers's message of "Mon, 29
 Mar 2021 19:01:43 -0700")
Message-ID: <87v999pequ.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1lR3wO-00B17I-KC
Subject: Re: [f2fs-dev] [PATCH v5 4/4] fs: unicode: Add utf8 module and a
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
Cc: tytso@mit.edu, drosen@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel@collabora.com,
 adilger.kernel@dilger.ca, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 andre.almeida@collabora.com, linux-ext4@vger.kernel.org,
 Shreeya Patel <shreeya.patel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> On Tue, Mar 30, 2021 at 02:12:40AM +0530, Shreeya Patel wrote:
>> diff --git a/fs/unicode/Kconfig b/fs/unicode/Kconfig
>> index 2c27b9a5cd6c..ad4b837f2eb2 100644
>> --- a/fs/unicode/Kconfig
>> +++ b/fs/unicode/Kconfig
>> @@ -2,13 +2,26 @@
>>  #
>>  # UTF-8 normalization
>>  #
>> +# CONFIG_UNICODE will be automatically enabled if CONFIG_UNICODE_UTF8
>> +# is enabled. This config option adds the unicode subsystem layer which loads
>> +# the UTF-8 module whenever any filesystem needs it.
>>  config UNICODE
>> -	bool "UTF-8 normalization and casefolding support"
>> +	bool
>> +
>> +# utf8data.h_shipped has a large database table which is an auto-generated
>> +# decodification trie for the unicode normalization functions and it is not
>> +# necessary to carry this large table in the kernel.
>> +# Enabling UNICODE_UTF8 option will allow UTF-8 encoding to be built as a
>> +# module and this module will be loaded by the unicode subsystem layer only
>> +# when any filesystem needs it.
>> +config UNICODE_UTF8
>> +	tristate "UTF-8 module"
>>  	help
>>  	  Say Y here to enable UTF-8 NFD normalization and NFD+CF casefolding
>>  	  support.
>> +	select UNICODE
>
> This seems problematic; it allows users to set CONFIG_EXT4_FS=y (or
> CONFIG_F2FS_FS=y) but then CONFIG_UNICODE_UTF8=m.  Then the filesystem won't
> work if the modules are located on the filesystem itself.

Hi Eric,

Isn't this a user problem?  If the modules required to boot are on the
filesystem itself, you are in trouble.  But, if that is the case, your
rootfs is case-insensitive and you gotta have utf8 as built-in or have
it in an early userspace.

> I think it should work analogously to CONFIG_FS_ENCRYPTION and
> CONFIG_FS_ENCRYPTION_ALGS.  That is, CONFIG_UNICODE should be a user-selectable
> bool, and then the tristate symbols CONFIG_EXT4_FS and CONFIG_F2FS_FS should
> select the tristate symbol CONFIG_UNICODE_UTF8 if CONFIG_UNICODE.





-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
