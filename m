Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FB452AC4D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 May 2022 21:57:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nr3Jw-000875-Vz; Tue, 17 May 2022 19:57:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nr3Jt-00086z-M0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 May 2022 19:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8/+x3vzbrMNcnz1n+GLFzwNBAsTVFdJPfgK2PM6XggE=; b=SwMhlq6fIKwwclEmsijzEj+E/C
 HFeiCHAzB57BGDXm9ynDIOU9HIHl5olVYfLZmvX3cEPPeenuXTh/sWiw/VicHYmMOtLa3rAl4HgIg
 A8uJTw4px+bq/hXUI+JASMrNsAvEx1VCaP332tPrFviNvqnJbsYa1hVfYznzaUTyjFps=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8/+x3vzbrMNcnz1n+GLFzwNBAsTVFdJPfgK2PM6XggE=; b=K27W/ql6xRmPCEORjGu77SGmrg
 KrH4/jjLUtO+lL5bTTeuyV2wmvLIaoGTQbOjIM2xj5NWVciDDWpHahIlMFAS3xFtN0uKfHTz7/IoE
 l5MdumX3VDXTGgmxIdgxiEYjNqpyQIUryFocswuSwmxhqbvdcm3lWmVR2OiNyRnBQ2lI=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nr3Jr-0007zq-Gn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 May 2022 19:57:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 594B31F4404A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652817428;
 bh=OWXF6pN1PKCgd1hX+us24uD4Px7KYa/a9N/AE+rwvM4=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=MNzP6OhNLXZ5yDXAQu5rueURwO2Uxu1GS86MzOjPufuvaNR9Q7nnkzH0RcByRFwAL
 XMfTwYuZ7UM3DgKVUwqlWcNvFs/vrPrzssPlBcjIY11866UwSxMHJcETkHJH+cwYcW
 MNBqilZDb+k5CZqGqVFjGwQRbY7EQ9QOEC0gjUB1t8her9T3p0PusulQScw8ffCHud
 bmEsilcAsOBVfaMoKtmtZ8Wk1eD7UCX8dKX9s2UNiqAN52rb00tWSPEO4tOkI8r61u
 qMfna+TLKoTGVPqOJJ/HP/1rP/wdwIrilQhv7AIKTYuOFPgxOnv5HFyy0gza8edrTi
 q1AadYCLotVbA==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: "Theodore Ts'o" <tytso@mit.edu>
Organization: Collabora
References: <20220511193146.27526-1-krisman@collabora.com>
 <YoP5jH5axe9ltX2Y@mit.edu>
Date: Tue, 17 May 2022 15:57:05 -0400
In-Reply-To: <YoP5jH5axe9ltX2Y@mit.edu> (Theodore Ts'o's message of "Tue, 17
 May 2022 15:37:48 -0400")
Message-ID: <87y1z0vsoe.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  "Theodore Ts'o" <tytso@mit.edu> writes: > On Wed, May 11,
 2022 at 03:31:36PM -0400,
 Gabriel Krisman Bertazi wrote: >> The case-insensitive
 implementations in f2fs and ext4 have quite a bit >> of duplicated code.
 This series simplifies the e [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
X-Headers-End: 1nr3Jr-0007zq-Gn
Subject: Re: [f2fs-dev] [PATCH v4 00/10] Clean up the case-insensitive
 lookup path
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
Cc: kernel@collabora.com, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

"Theodore Ts'o" <tytso@mit.edu> writes:

> On Wed, May 11, 2022 at 03:31:36PM -0400, Gabriel Krisman Bertazi wrote:
>> The case-insensitive implementations in f2fs and ext4 have quite a bit
>> of duplicated code.  This series simplifies the ext4 version, with the
>> goal of extracting ext4_ci_compare into a helper library that can be
>> used by both filesystems.  It also reduces the clutter from many
>> codeguards for CONFIG_UNICODE; as requested by Linus, they are part of
>> the codeflow now.
>> 
>> While there, I noticed we can leverage the utf8 functions to detect
>> encoded names that are corrupted in the filesystem. Therefore, it also
>> adds an ext4 error on that scenario, to mark the filesystem as
>> corrupted.
>
> Gabriel, are you planning on doing another version of this patch
> series?
> It looks like the first two patches for ext4 are not controversial, so
> I could take those, while some of the other patches have questions
> which Eric has raised.

Hi Ted,

I'll be reworking the series to apply Eric's comments and I might render
patch 1 unnecessary.  I'd be happy to send a v5 for the whole thing
instead of applying the first two now.

Thanks, 


-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
