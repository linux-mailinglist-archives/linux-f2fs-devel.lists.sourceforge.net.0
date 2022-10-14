Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CCC5FEF7C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Oct 2022 16:00:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ojLEH-0002hK-Ea;
	Fri, 14 Oct 2022 14:00:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dhowells@redhat.com>) id 1ojLE9-0002gS-Vo
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Oct 2022 13:59:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:Date:Content-ID:Content-Type:
 MIME-Version:Subject:Cc:To:References:In-Reply-To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k8qQltuyjmygy+O43yanVxeFaxBvrjiQoX3IXlPZtGE=; b=aA/ArgfHMb2/4ZdJ8pMbBcz5ei
 kOe1XhubjW2yxIg+SKDw/ayr7ghTirGiEnqGCX9mizPk+3tgoQQemlHm5MMR4JytP8EXhVat3NGWC
 js4HHBkGpUEbHybJbgSQ1OEYO8J+75d1VZASkzrpZsly9938aEqPQ1+lLHpO1VpVEZYE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:Date:Content-ID:Content-Type:MIME-Version:Subject:Cc:To:
 References:In-Reply-To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k8qQltuyjmygy+O43yanVxeFaxBvrjiQoX3IXlPZtGE=; b=M21BiMCIBFv8H/SqxLZne2uMdj
 pEd4C7OyyLEFcvizIoUD+hyXM2n/2TschKokTcIsM3AGlQ+CEc4H/RC2oTNbZMJtRNmriOnEcJyqm
 Ac24ClVLGeuASeNz3y6gsGoHVL9u9eVSouYnAvHVSqY7kzK3J7xjQ7rKfxu4MIWz2UJo=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ojLE5-00075r-4B for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Oct 2022 13:59:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665755983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k8qQltuyjmygy+O43yanVxeFaxBvrjiQoX3IXlPZtGE=;
 b=DtDYcrfgVOqZ3hsZHwwjB7vAgk5Ps+T8WPi2LiYhXUt71/eJwNrpWh8fzfclv/Cp7MSCvO
 F2LMAnKwXgs7lMfEVb0m3InKwXJctLzg6j1h4yYUJ65A/cwm7uIO2/lRYwyzzQcIF11aWK
 ft356x3eEdF/wfAS42bRwaWXK6FGsno=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-0ngC2H1gONipQ71LSLOWqQ-1; Fri, 14 Oct 2022 09:59:38 -0400
X-MC-Unique: 0ngC2H1gONipQ71LSLOWqQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2DFA3C10687;
 Fri, 14 Oct 2022 13:59:37 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 456D84030DF;
 Fri, 14 Oct 2022 13:59:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220901220138.182896-6-vishal.moola@gmail.com>
References: <20220901220138.182896-6-vishal.moola@gmail.com>
 <20220901220138.182896-1-vishal.moola@gmail.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
MIME-Version: 1.0
Content-ID: <1569539.1665755974.1@warthog.procyon.org.uk>
Date: Fri, 14 Oct 2022 14:59:34 +0100
Message-ID: <1569540.1665755974@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Vishal Moola (Oracle) <vishal.moola@gmail.com> wrote: >
 Convert
 to use folios throughout. This function is in preparation to > remove
 find_get_pages_range_tag().
 > > Also modified this function to write the whole batch one at a time, >
 rather than callin [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ojLE5-00075r-4B
Subject: Re: [f2fs-dev] [PATCH 05/23] afs: Convert afs_writepages_region()
 to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 dhowells@redhat.com, linux-mm@kvack.org, linux-nilfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Vishal Moola (Oracle) <vishal.moola@gmail.com> wrote:

> Convert to use folios throughout. This function is in preparation to
> remove find_get_pages_range_tag().
> 
> Also modified this function to write the whole batch one at a time,
> rather than calling for a new set every single write.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Tested-by: David Howells <dhowells@redhat.com>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
