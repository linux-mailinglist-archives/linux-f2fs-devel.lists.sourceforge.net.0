Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F5C587567
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Aug 2022 04:07:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oIhJL-0000os-F3; Tue, 02 Aug 2022 02:07:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <joe@perches.com>) id 1oIhJK-0000nz-6M
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Aug 2022 02:07:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f5iIetCrmnYzeYRQ3imgnQc8Cgb8c7YvvsA7HnVEoGc=; b=SFHMoyaKWDPEBB9McpnTBwAykO
 YHLgTBK+M/QorjtoyP1bR/2Qn8CryL+Fv8chVQrxRBFO7CVBicksAZffUQzIPfJXTVuuZxtUjGFkw
 vge7QgGnX0uOIO3dpVZ2CpH9oU8erUbsNUmZ9oixGWXTHyJsGZzLm/F44hSHpNUU32Hc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f5iIetCrmnYzeYRQ3imgnQc8Cgb8c7YvvsA7HnVEoGc=; b=aaInng+GBl+ax7fZsFwJST+fso
 kmqrja8COnkFp3y15xb+e/w0XndTpgQqV7grSieUdRPB1a1Zrwn+uoAa19jFW+nc6PhSu+Rp0/1wb
 ut2W+tV0dFGbzyArYa9QNExObBXvTg62uY9ZaIsJjLF6rs4sCOCOhWKnNoMyFLGjXHYA=;
Received: from smtprelay0012.hostedemail.com ([216.40.44.12]
 helo=relay.hostedemail.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oIhJI-000Fuj-TT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Aug 2022 02:07:05 +0000
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay03.hostedemail.com (Postfix) with ESMTP id 62968A0D0C;
 Tue,  2 Aug 2022 01:42:46 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf18.hostedemail.com (Postfix) with ESMTPA id 0C36B30; 
 Tue,  2 Aug 2022 01:42:44 +0000 (UTC)
Message-ID: <b43b3babb8aea836add289245c640688bec87829.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Christoph Hellwig <hch@infradead.org>, studentxswpy@163.com
Date: Mon, 01 Aug 2022 18:42:44 -0700
In-Reply-To: <YugaBtQcoR4XhXiQ@infradead.org>
References: <20220801092202.3134668-1-studentxswpy@163.com>
 <YugaBtQcoR4XhXiQ@infradead.org>
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Spam-Status: No, score=4.79
X-Stat-Signature: wdqedbwedqttrydjhn48w4z4t5k69399
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 0C36B30
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18zQ27Sw8bVrVJiHLv86TbextMAqxUL208=
X-HE-Tag: 1659404564-617352
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 2022-08-01 at 11:23 -0700, Christoph Hellwig wrote:
 > On Mon, Aug 01, 2022 at 05:22:02PM +0800, studentxswpy@163.com wrote: >
 > From: Xie Shaowen <studentxswpy@163.com> > > > > replace kmalloc [...] 
 Content analysis details:   (1.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.40.44.12 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [216.40.44.12 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines 1.0 FORGED_SPF_HELO        No description available.
X-Headers-End: 1oIhJI-000Fuj-TT
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: Replace kmalloc() with
 f2fs_kmalloc
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
Cc: Hacash Robot <hacashRobot@santino.com>, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 2022-08-01 at 11:23 -0700, Christoph Hellwig wrote:
> On Mon, Aug 01, 2022 at 05:22:02PM +0800, studentxswpy@163.com wrote:
> > From: Xie Shaowen <studentxswpy@163.com>
> > 
> > replace kmalloc with f2fs_kmalloc to keep f2fs code consistency.
> 
> For that removing f2fs_kmalloc entirely would be way better.

Dunno, maybe doubtful as there's a specific "fault injector" test
built around f2fs_<foo>alloc. (CONFIG_F2FS_FAULT_INJECTION)

For a student lesson, it would significantly better to compile any
patch, especially to avoid broken patches, before submitting them.




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
