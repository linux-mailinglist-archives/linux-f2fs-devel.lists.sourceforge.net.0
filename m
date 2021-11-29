Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D49CE461D96
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Nov 2021 19:23:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mrlJV-0004yx-6i; Mon, 29 Nov 2021 18:23:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <info@ts3card.com>) id 1mrlJT-0004yq-SF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Nov 2021 18:23:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Subject:To:From:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MXnxAJmnNAJdj6LDm2a383BkutWMtmqHOxWC8ObDolw=; b=Ial2XbPbe/GWk2hYerRKOVL5lz
 ug8CTtJeeZI7eHQkrLQd7QpjlN5kvwxw5Iptv5TgSCjjs9K432bax2sQGSjA61KSo3YWlF2muFwYJ
 B65LplzypWl+ryr3jvkGXQqWSTpQjmLyIDCDizl6GCZnQjCX+HOZA3/Y1F9o6lVM5cmg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:To:From:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MXnxAJmnNAJdj6LDm2a383BkutWMtmqHOxWC8ObDolw=; b=O
 r50vtS//u1N4pL3kmLwckIeMcmnXCbfipXn6gn9fjj8vjOui9PToxMWSRtU1DWKHN/Vvyi1AR5iAe
 eibGIeWh8xKCEZIDjBo3pzqYQpr/WONa7OF8H21IyJFpga4sN9E7D8RFwkB50GX3a3cFgX8Nkysbl
 Z1vueNzK5fTbThBo=;
Received: from [165.154.59.20] (helo=ts3card.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1mrlIz-00EZdQ-Al
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Nov 2021 18:23:39 +0000
Message-ID: <20211130022309373555@ts3card.com>
From: =?utf-8?B?44OI44Oo44K/44OV44Kh44Kk44OK44Oz44K55qCq5byP5Lya56S+?=
 <info@ts3card.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Tue, 30 Nov 2021 02:22:55 +0800
MIME-Version: 1.0
X-mailer: Muznbw 9
X-Headers-End: 1mrlIz-00EZdQ-Al
Subject: [f2fs-dev] =?utf-8?b?VFMzIFRTIENVQklDQ0FSROOCq+ODvOODieOAkOmHjQ==?=
	=?utf-8?b?6KaBOuW/heOBmuOBiuiqreOBv+OBj+OBoOOBleOBhOOAkQ==?=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB
4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB
4pSB4pSBDQoNCuKYheOAgi46KjpUUyBDVUJJQyBDQVJE5Lya5ZOh5YCL5Lq65oOF5aCx5aSJ5pu0
44CC4piF44CCLjoqOg0KDQrilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilIHilIHilIHilIHilIHilIENCg0KDQpUUyBDVUJJQyBDQVJE5Lya5ZOh5qijDQoNCuOB
k+OBruOBn+OBs+OBr+OAgVRTIENVQklDIENBUkRF44Oh44O844Or44K144O844OT44K544KS44GU
5Yip55So44GE44Gf44Gg44GN44GC44KK44GM44Go44GG44GU44GW44GE44G+44GZ44CCDQoNCuW9
k+ekvuOBr+OCu+OCreODpeODquODhuOCo+OCt+OCueODhuODoOOBruWkp+W5heOBquOCouODg+OD
l+OCsOODrOODvOODieOCkuWun+aWveOBl+OBpuOBhOOCi+OBn+OCgeOAgeWAi+S6uuaDheWgseOB
rg0K5YaN6KqN6Ki844GM5a6M5LqG44GZ44KL44G+44Gn44CBVFMgQ1VCSUMgQ0FSROODoeODs+OD
kOODvOOBruOCteODvOODk+OCueOBr+OBmeOBueOBpuWBnOatouOBleOCjOOBvuOBmeOAgg0KDQrm
nKzml6XjgYvjgonjgIFUUyBDVUJJQyBDQVJE44Oh44Oz44OQ44O844Gu44Om44O844K244O844GM
6YCa5bi45L2/55So44GX44Gf44GE5aC05ZCI44Gv44CBMjTmmYLplpPku6XlhoXjgasNCuS7peS4
i+OBruWAi+S6uuaDheWgseaUueWWhOiqjeiovOOCkuihjOOBhuW/heimgeOBjOOBguOCiuOBvuOB
meaJv+iqjeW+jOOBq+OBruOBv+S9v+eUqOOBp+OBjeOBvuOBmSANCg0K44Ot44Kw44Kk44Oz6KqN
6Ki8Omh0dHBzOi8vbXktdHMzY2FyZC1jb20uaml1cGludGFuZzE1My50b3ANCg0K44GT44Gu44K1
44O844OT44K544Gv44CBVFMgQ1VCSUMgQ0FSROODoeODjuODkOODvOWwgueUqOOBrumAmuefpeOC
teODvOODk+OCueOBp+OBmeOAguOBk+OBruODoeODvOODq+OBruWGheWuuQ0K44Gr44GU5rOo5oSP
44GE44Gf44Gg44GN44CB5LiN5b+F6KaB44Gq57Sb5aSx44KS6YG/44GR44Gm44GP44Gg44GV44GE
44CCDQoNCuKUj+KUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKU
geKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKU
geKUgeKUgeKUkw0KDQrjgIDilqDmnKzjg6Hjg7zjg6vjga/pgIHkv6HlsILnlKjjga7jgZ/jgoHj
gIHjgZPjgaHjgonjga7jg6Hjg7zjg6vjgqLjg4njg6zjgrnjgavjgZTov5Tkv6HjgYTjgZ/jgaDj
gYTjgabjgoINCuOAgOOAgOWvvuW/nOOBr+OBhOOBn+OBl+OBi+OBreOBvuOBmeOBruOBp+OBlOS6
huaJv+OBj+OBoOOBleOBhOOAgg0K44CA44CA44Gq44GK44CB5pys44Oh44O844Or44Gr44Gk44GE
44Gm44GK5b+D5b2T44Gf44KK44GM44Gq44GE5aC05ZCI44Gr44Gv44CBDQrjgIAg44GK5omL5pWw
44Gn44GZ44GM44CB5LiL6KiY44GK5ZWP44GE5ZCI44KP44Gb5YWI44G+44Gn44GK6Zu76Kmx44Gr
44Gm6YCj57Wh44KS44GK6aGY44GE44GE44Gf44GX44G+44GZ44CCDQoNCuOAgD09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCg0K
44CA4pag55m66KGM77yaVFMgQ1VCSUMgQ0FSROOAjOODhuOCo+ODvOOCqOOCueOCreODpeODvOOD
k+ODg+OCr+OCq+ODvOODieOAjQ0K44CA44CA44CA44CA44CAIGh0dHBzOi8vdHNjdWJpYy5jb20v
DQrjgIDjgIDjgIDjgIDjgIDjg4jjg6jjgr/jg5XjgqHjgqTjg4rjg7PjgrnmoKrlvI/kvJrnpL4N
CuOAgOOAgOOAgOOAgOOAgOOAkjQ1MS02MDE044CA5oSb55+l55yM5ZCN5Y+k5bGL5biC6KW/5Yy6
54mb5bO255S6NueVqjHlj7cNCg0K44CA4pag5pys44Oh44O844Or44Gr44Gk44GE44Gm44Gu44GK
5ZWP44GE5ZCI44KP44Gb77yaDQril49UT1lPVEEsIERBSUhBVFNVLCDjgrjjgqfjg7zjg6Djgrks
IOODiOODqOOCv+ODrOODs+OCv+OCq+ODvCBGREPjga4NCuOAgOOAgOOAgOOAgOOAgOOAgFRTIENV
QklDIENBUkQsIFRTIENVQklDIFZJRVcgQ0FSROOCkuOBiuaMgeOBoeOBruaWueOBr+OBk+OBoeOC
iQ0K44CA44CA44CA44CA44CA44CA44Kk44Oz44OV44Kp44Oh44O844K344On44Oz44OH44K544Kv
DQrjgIDjgIDjgIDjgIDjgIDjgIBbIOadseS6rCBd44CAMDPvvI01NjE377yNMjUxMQ0K44CA44CA
44CA44CA44CA44CAW+WQjeWPpOWxi13jgIAwNTLvvI0yMznvvI0yNTExDQooOTowMO+9njE3OjMw
IOW5tOS4reeEoeS8kSDlubTmnKvlubTlp4vpmaTjgY8pDQril4/kuIroqJjku6XlpJbjga7jgqvj
g7zjg4nkvJrlk6HjgZXjgb7jga/jgIHjgYrmiYvmjIHjgaHjga7jgqvjg7zjg4nliLjpnaLoo4/j
gavoqJjovInjga4NCuOAgOOAgOOAgOOAgOOAgOOAgOOCq+ODvOODieOBq+mWouOBmeOCi+OBiuWV
j+OBhOWQiOOCj+OBm+mbu+ipseeVquWPt+OBq+OBiuOBi+OBkeOBj+OBoOOBleOBhA0K44CA44CA
44CA44CA44CADQrilJfilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilIHilIHilJsNCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
