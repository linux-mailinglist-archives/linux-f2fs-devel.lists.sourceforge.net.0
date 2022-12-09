Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2856483DA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Dec 2022 15:37:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p3eVQ-0006kg-Ex;
	Fri, 09 Dec 2022 14:37:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gabriel@krisman.be>) id 1p3eVC-0006kP-RZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Dec 2022 14:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+rKQmaQriEX7XnldoSzk56zNLF0zT0xTnNbdoxc3XiY=; b=TJ8LZjq6gOm43ukEgUiNo2eWwF
 xKuHXlxxz8/d010n340hTnKE4TgtQmichNHDbNl6ii/A5fFJKc1JF1DqYPkhsTUzgSH5XnpMzdNjF
 5MXtLrdDPgLYWn+XjhI8vpTKxXuET9BzdrBVx5ycUIb65WJrN0I/UZesupTnUrzpIMXA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+rKQmaQriEX7XnldoSzk56zNLF0zT0xTnNbdoxc3XiY=; b=GDvHzlJuVWTrhYlfzB9NvgOt0F
 NLXvz5qV/OBzNk+eylkwpWmwrU7DDTnSDWRF4aEtpGkisNDVNFh2ARq1dzh36qCbQ2S6u+gralydV
 Q2afK7jb4KeVQJeR0/8pBKwri7b2YAbFrujdMWcX+sJRGGJknihndkeE1w/KxXwCOjlM=;
Received: from mslow1.mail.gandi.net ([217.70.178.240])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p3eUs-00BO08-TS for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Dec 2022 14:37:20 +0000
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 86CFAC4AC8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  9 Dec 2022 13:47:59 +0000 (UTC)
Received: (Authenticated sender: gabriel@krisman.be)
 by mail.gandi.net (Postfix) with ESMTPSA id 31DD51BF207;
 Fri,  9 Dec 2022 13:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=krisman.be; s=gm1;
 t=1670593666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+rKQmaQriEX7XnldoSzk56zNLF0zT0xTnNbdoxc3XiY=;
 b=RJRe/h7nXSXyFpHYeA8YZHnwGpXNox2c5FCAHXaTVd4aqjHXtPC/z9GRr5Pl85xBnBTbyX
 3JtJEZsNbZvS1EuyfWeFdOxGtTQPiQuGxMdr133LGLFhn/R0eOkQ7QSAzJ8fRsaBla/XBz
 S1ue/jg4rGVTUjG+5EPveIVFqzJts3HwCZmt8Bj1u+V+0BXhKHqDGq74bAvvG4Wi0iBsmh
 oYsg2Szvvu5uf3CqBp0jgMpKz8DrgBTCQ5uTPihqCXA+8ogbzL87BOdVBAQh2/bJJSVCOb
 Mxillg4jZWxw/JKCqk2qadCUG2OK+uIA677sHIq9Z4IuR420jjLT4zySnVrwfw==
From: Gabriel Krisman Bertazi <gabriel@krisman.be>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
References: <20220913234150.513075-1-krisman@collabora.com>
 <Yy0t8WYhM+Dv3gX1@sol.localdomain> <87fsgi2lax.fsf@collabora.com>
 <87tu47thie.fsf@suse.de>
 <2859a108-3189-6407-2d11-6b9f0948f718@collabora.com>
Date: Fri, 09 Dec 2022 10:47:37 -0300
In-Reply-To: <2859a108-3189-6407-2d11-6b9f0948f718@collabora.com> (Muhammad
 Usama Anjum's message of "Thu, 8 Dec 2022 19:38:46 +0500")
Message-ID: <871qp8n0xy.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Muhammad Usama Anjum <usama.anjum@collabora.com> writes: >
 On 10/14/22 4:45 AM, Gabriel Krisman Bertazi wrote: >> Gabriel Krisman Bertazi
 <krisman@collabora.com> writes: >> >>> Eric Biggers <ebiggers@kernel.org>
 writes: >>> >>>> On Tue, Sep 13, 2022 at 07:4 [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.3 RCVD_IN_VALIDITY_RPBL  RBL: Relay in Validity RPBL,
 https://senderscore.org/blocklistlookup/
 [217.70.178.240 listed in bl.score.senderscore.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: krisman.be]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [217.70.178.240 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p3eUs-00BO08-TS
Subject: Re: [f2fs-dev] [PATCH v9 0/8] Clean up the case-insensitive lookup
 path
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
Cc: kernel@collabora.com, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Muhammad Usama Anjum <usama.anjum@collabora.com> writes:

> On 10/14/22 4:45 AM, Gabriel Krisman Bertazi wrote:
>> Gabriel Krisman Bertazi <krisman@collabora.com> writes:
>> 
>>> Eric Biggers <ebiggers@kernel.org> writes:
>>>
>>>> On Tue, Sep 13, 2022 at 07:41:42PM -0400, Gabriel Krisman Bertazi wrote:
>>>>> Hi,
>>>>>
>>>>> I'm resubmitting this as v9 since I think it has fallen through the
>>>>> cracks :).  It is a collection of trivial fixes for casefold support on
>>>>> ext4/f2fs. More details below.
>>>>>
>>>>> It has been sitting on the list for a while and most of it is r-b
>>>>> already. I'm keeping the tags for this submission, since there is no
>>>>> modifications from previous submissions, apart from a minor conflict
>>>>> resolution when merging to linus/master.
>>>>
>>>> Who are you expecting to apply this?
>>>
>>> Hi Eric,
>>>
>>> There are three groups of changes here: libfs, ext4 and f2fs.  Since the
>>> changes in libfs are self-contained and only affect these two
>>> filesystems, I think it should be fine for them to go through a fs tree.
>>>
>>> The bulk of changes are ext4, and Ted mentioned on an earlier version
>>> that he could pick the first patches of this series, so I'm thinking it
>>> should all go through the ext4 tree.  If Jaegeuk acks, the f2fs changes
>>> are safe to go with the rest, or I can send them afterwards as a
>>> separate series once the libfs code is merged.
>> 
>> Ted,
>> 
>> Does the above plan work for you? Do you intend to pick this up for the
>> next merge window?
> It seems like this series hasn't been picked up. Any ideas on what can
> be done?

I got tired of the radio silence and gave up on it.  If there is interest,
feel free to respin it once more.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
