Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95841CDF4AE
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Dec 2025 06:50:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSrH3+gnMBIKBIAa8aEX8+hDGDQdRYnqa6/atOvlYyg=; b=hbZuVimWdOH9rLSK2nJw7GcfN5
	rIRfku9neuAF5I9QL3uhLHdIVpAF9CqLa6Era1HVxiT8gbVG/cbEindWND/qyxeZEqMPCPb2G5/Bn
	2It28PBlhJhz5h5FuIJtEu9whyWPbzbZCM6p4mXD91O6pddhLWHy60QSjMvJsIe0UmxY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZNBj-0008SF-KE;
	Sat, 27 Dec 2025 05:50:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1vZNBf-0008RH-FM for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 05:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TG271bKQApM0fYIfFVDzFxUo5DE5jbe+zM7GFKA6GnY=; b=PNuuaGYpFHrCXo/J7GVmIfjBYj
 6t7Gi/BI9NirtnKQekKfCz517YAsUSRZeXsloPhYg6llPiZrB9qHzTE1wGZgC4Mf8jgw1nAaDv1zo
 wbcFkSzruBLskEZCDq3Vpbp+5Q6Z7bjibyrQD2VvrxzLKWglLuS8KxtzWID1jcpRO2ew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TG271bKQApM0fYIfFVDzFxUo5DE5jbe+zM7GFKA6GnY=; b=N5etMU4ORf+IiAlrBGZv++IFZO
 AFYyVa6Qtiy7PLZUOXpemFidPUmujO3iWdhdO/rsSf6m2AghrRvSfIoYDGqP4jb+yr+M1D7IvSDFy
 Jppn5HNKCRvFlnBdP7ACAW2dm08MCXjNOPq50SpC+zUrwUdN7vDE57arJnVxkKdeDlIg=;
Received: from mail-koreacentralazolkn19013075.outbound.protection.outlook.com
 ([52.103.74.75] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vZNBf-0001ml-GX for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 05:50:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGE79ElSLfzWsudRQ6vt48qabBBvFWzuVAT6uVG9tHzDdj1N+WKQGNQS/ohD64UVHUYVk5lB3RX7tC3PNlRrwgumnJkkGrkBGKhzQhPKKxDk36yWhtpgUQItabHXCpeDv8+agDrxUCyaRIN9KilpTwEv1lMn9MhXehVf9C/22CNbUt45gnEUBXW07f4RhFfIDD6WEl3GH0j/IeeMnH3CCIVbjwGHzX0auA8HA1wtNLIOmHBvqHrA1McoOEtyxmG4V5mxqr7AkRPfre1CxWz8MNt/4oWflSZoiiYdaXrevMW6PrToMuh3k4KyBdcE4FZWKFgMFJi8/4/gLnBP49R+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TG271bKQApM0fYIfFVDzFxUo5DE5jbe+zM7GFKA6GnY=;
 b=LnNrMLm5G84aYYYwHYOqcX0Jbg0laiGsgNX2Eif/PZnoygJK6YaptA/Uki3QGmiARIy7ccEN2Hn5XUkXNZzZnky7ZShQLwo3dmrz07CFH5SFiBIEvwvfjHo2sMKvyGzgHrMRm4iFV4DIzQSvFdDA6GayPERnt3UtLrLRxXKsRB8IzqnNocNgK3ImY0srqcjwZ48lIEUvPoWq6pMhjQcMGDyDMbvnLRYkjGJE0HYXDfXaYDpM28wcGgp3Cp6oivSlfMjpcnxg1nP53LPt5ISSnDDRmN3UUjg4pOuXBKGZEYTn6jlYP9VJrK1DRjgv8ODLAI9WVo1hEU1JrQcBwzM0QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TG271bKQApM0fYIfFVDzFxUo5DE5jbe+zM7GFKA6GnY=;
 b=tC4gg30MN0jJzVuD+zZBul6GrQGYbcZeKQkideA6vLAHsts+3fMEhA2ecbWOGsd+cX6m/0SdbAXOnh1AotTpYST077FjZZXiTU2QgUufNfcAQcCbzt1XPdkXCeB7KZy11iWkkMv103UKfaEwxQo9uthCg1EgEIRBJoV7r1If1Xsap17aZfFa7vX95R/6cSr5b0xtv841vqBkdZVsG+X85/hfGFMra3NvNbhR8haAXdEGeSEUDpDoCeiDyAvPK2RV8rqqABVe7hQSzyxJBJx5EMAC7JkprFWUidiG2u8krHK0Ii93BWzo65x8AVSI26QJbiozUkyJOg/e8+3obVZawA==
Received: from SEZPR02MB5520.apcprd02.prod.outlook.com (2603:1096:101:47::14)
 by SEYPR02MB7099.apcprd02.prod.outlook.com (2603:1096:101:1a8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Sat, 27 Dec
 2025 05:49:46 +0000
Received: from SEZPR02MB5520.apcprd02.prod.outlook.com
 ([fe80::ebcf:d79b:73ca:4120]) by SEZPR02MB5520.apcprd02.prod.outlook.com
 ([fe80::ebcf:d79b:73ca:4120%4]) with mapi id 15.20.9434.001; Sat, 27 Dec 2025
 05:49:46 +0000
Message-ID: <SEZPR02MB5520E781DA8C03DA7B539CAE99B1A@SEZPR02MB5520.apcprd02.prod.outlook.com>
Date: Sat, 27 Dec 2025 13:48:17 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yunlei He <heyunlei1988@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251107062907.384287-1-heyunlei1988@gmail.com>
 <268cf104-6f77-419c-931e-c5cd82c3a921@kernel.org>
 <047b0d23-102e-41ce-b8b8-c7cb8ac31b21@gmail.com>
 <128fd300-d2d1-4169-a86f-a0babb47101b@kernel.org>
 <d6557e0a-a433-4dd1-bf02-d74cc6998592@gmail.com>
 <67e83a0a-74d3-43cc-902a-28172cb33149@kernel.org>
 <73a0bd40-385f-4112-93c6-995d98707e2c@gmail.com>
 <f1d1733c-e771-4fb6-bf02-f174e84a0252@kernel.org>
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
In-Reply-To: <f1d1733c-e771-4fb6-bf02-f174e84a0252@kernel.org>
X-ClientProxiedBy: SEWP216CA0009.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::19) To SEZPR02MB5520.apcprd02.prod.outlook.com
 (2603:1096:101:47::14)
X-Microsoft-Original-Message-ID: <ed147970-8d7f-4429-a799-d5cbfbf64040@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5520:EE_|SEYPR02MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe2f7d4-10f0-468b-c32d-08de450bbd57
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799012|8060799015|41001999006|9112599006|23021999003|51005399006|12121999013|5072599009|6090799003|15080799012|461199028|3420499032|440099028|3412199025|40105399003|10035399007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWozUUg1bTBTSnRLS0FoTEs2OEpqT1BTM1lWa2t6ZFRWLzFFdHkySm9rOHpa?=
 =?utf-8?B?azFkejNwZ2p1S2xXb0RYd2o0SGMyZ2NzRVRISG56cnpJNEVhSzlIOW9CSElN?=
 =?utf-8?B?OGtsNUx6U2R5a0h5UFJMMW43ajFUeE55MFd1aThhb1g0eFVXcS9GTm5VVVpC?=
 =?utf-8?B?S1NVYjNwb2NYUHlyTzliN1VBYmM0RTNKTHVRYXhJaVNKUmJ5NnNsdS95cXhy?=
 =?utf-8?B?TmJ4WW15OVZ0cldWS2tJV3owMFBrQnFKYmx2QU1FSVdKU2hnc3BRYzIrbS8w?=
 =?utf-8?B?R1F2SWQ0Wms3bnNqUWVuRGhjcVJnZlFtdm9DRWNibFNDbEZuUFZvNlZYMFpq?=
 =?utf-8?B?ekZMaERiNkhCSkRmWFYzbUN4blVWM21IcVhKeUNzRU93eG5XZEpsU2xCWXJB?=
 =?utf-8?B?ejM2ZmtmYmZaUEdZWUs1VlE0YjRMUHVrQjNCejF3NThFM3VPMHp5L2llYlk4?=
 =?utf-8?B?ZS9LZU5MUEJQNTROeUkyOVE4UDRtamJTN3ZxdVZaQjlMMk5ia25kcnc2c2c2?=
 =?utf-8?B?UU1FWEoxSmhnTzhvdGRaZTVhSTExdThETGxScjRqRHViWGdMZm00YlFEZzMy?=
 =?utf-8?B?ZUVERWF4Nm1JYk9PaHROcmxSUFl4NTZyakI1TmErN2N4Q3FQbi9IOTMwM1ps?=
 =?utf-8?B?VldXQ0VIOHlRcERKbmd3UHRNazRuSm5wZWYwOVBRUTd6WkV0MmxDTmFGODR1?=
 =?utf-8?B?UFkzaThmRnZDbFZjRTQ4VURyNjg4eWFSSkdqRiszczdzelpRcFJGYmtiWFAr?=
 =?utf-8?B?QklpeFZ5U002VUlnSUNrbkhlc3JvR1haQkZyVCtJYWZmWVdmdlFUWFpvSDlX?=
 =?utf-8?B?dmd0VzllQ1pPVlFJd29BS0xKOEdkY2V5L0lLL1RiRVgrNDk5d1U5Z2cvN3NR?=
 =?utf-8?B?cEpEWVdHc1ZpZ2dXMk9MRkFiL24vcm5odXNWbGZOUkJ6NHZxeXpEQ2FvcUxI?=
 =?utf-8?B?UHVhV0pYWS82aFNPYzQwYjFRb2NGZkFzV0F6VGE4dk9DaXVKUFBBNWhrbkRH?=
 =?utf-8?B?ZGxnQUNBRVU0V3BNdFJSZm44OWpoUmtxdHYzbkkrSXF3cGVKNVJpemtyeHo0?=
 =?utf-8?B?OUR4Mm8yU09tdmo5VnZKeGxBczc0dmRYMTRmS0FnVU0reVM3eTk1NFliUHBt?=
 =?utf-8?B?Zm1MY0NiTEw1YjUvOFB5c212QW40NENxNTdBeEdCMDBDWW5JMFJ2N25iS2tl?=
 =?utf-8?B?ejhOb3M1RWhJbVhDampCVlRWWjNzSjFqeGI3WlFNODllcTJ5WjdjOGFLZzM4?=
 =?utf-8?B?K3RIRWRqcXdRVUtKRHdnbStGYlpvVk1TSlhTdng1UWtVWnBOUy9hQXVCRmo4?=
 =?utf-8?B?MTNiemdmaHBkY01mdWlwVk1nU0NxYzhOZ05CeENyMUlnNDEvNExsVW5qdlY4?=
 =?utf-8?B?UDg4bFVRUnNiTTVzYytuSGlYODdRcFNLTTRsSk1SZlIrSDlXNmVNbWJoQzNL?=
 =?utf-8?B?bVFmYU1kU3pBTjFzM2VLeGtZY0krclJUT3diUXNhWnIzaWFVeElhVm5yTldW?=
 =?utf-8?B?ZHJ5QThqcjlUTHRsUy9yejN0TlZubFc5dHpaQ2Vxb2JzRjF4d2h2MVE2Yzha?=
 =?utf-8?B?SmRPS3ZrQVhjSnFGN29GOXZBdFpoM0xyalJGZllkWWlyTUZra1l1VFdpMmdW?=
 =?utf-8?B?Rmc1V2FVcjlFS2huNEU5WlFXYitUQ0cxZ09UcWY0Mm5qWHpnMlVlclpMN1A5?=
 =?utf-8?B?QUhYZFJWOWZ4Tmx3bkN5b2IvcW9IZTRlN1lEYlNhVit0ZkFqMHV4RnZWakts?=
 =?utf-8?B?TTJnejFxdENzWjhRZUNSbnBkUHZnb3JBdE5Qd1QvY1RJY1o5UUhsY0hpNjdB?=
 =?utf-8?B?VE83bG1xSDlSWVVjYkhZUVdlY29tb1FpTjdXeGpadjhqN3hsS0NrQzhvanZp?=
 =?utf-8?Q?3xleuFHnodEcO?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmVLMkRHNHh6RGZHSmRpZSt6ZUtkZWZiSlRkVmRUOXY5NVRSWjZ3bUp3OHpY?=
 =?utf-8?B?UE9QYjM1UlNlalRRb28rNmM5TG5tSzJnb2czcVllcCtiajByb3hYL2ZlOFNU?=
 =?utf-8?B?d0lHWkJWOFN5TEthZzA1OEo2SFFyV3BrcW1uN2JtRHl6VHpRdHJ5QW1JMFJD?=
 =?utf-8?B?U09Vb2xuZjd2L3BHbENwWWJ6VFpJcHRZQWp6cVBid0xmVXltQVRGQXdBOUZi?=
 =?utf-8?B?YjNlcnFmMGNaOXRVMXZaN1lHbmVhN3FUM0hNQ1lQdjlUSE14SnFFa1YwM2No?=
 =?utf-8?B?d3YycjNSai9NZlFubTRTempRVTNSZ0k3azZ3SWQvYVZrTDZrMzFKUm10NUc4?=
 =?utf-8?B?eG9pRXhGNmhZbE9vNlY2OUdzdFhldjVDc1JtcGtEeWZxY1NFcUFOM3pmSkVY?=
 =?utf-8?B?bUNaUE5DSmNsRzJob1BiRTJtMnd4TGlrendaSVd2a01IMlM3OGFucTNQWnNR?=
 =?utf-8?B?NElmVGNpTWt5TW1CcDQ3UnRyTmtwT2xTaVhrbVJ1RENhUkVQTGl5Q2xJWUhJ?=
 =?utf-8?B?akVqckFVcSs5dXBVWUFRNGJvVVkyQi9xaEF6dDZpS3ZlSFpibG9QRXQrTWdm?=
 =?utf-8?B?L0FVRGp2OUZ6ZjBoNEVJQkZUVWJDbGQyTUdEeDJaV2JKK0RHb2hRUHBLcndH?=
 =?utf-8?B?RXhhNHBqYTRLZFdEZm00cGZScUdRSm9EOTlaTmxja1k1SWk1L1JudmJYNmRv?=
 =?utf-8?B?SHRZOURPSUMyZllVYXhGUjMxZEROalZ4dUVXR0UxZExXVHd1V09nV1l2RW9Q?=
 =?utf-8?B?TXkrb2NsU3Q0a1RrSEgyNVdDbTNOdFBvdU5MSnQ2TldGRHEwcjlPQW8zMkdQ?=
 =?utf-8?B?ejRCdkFXWThDUS82RGFPakx3a0dQQmtsM25wSnJxdzBJK2g0aFNCamFDenFo?=
 =?utf-8?B?MVFZbSs2QVRvb2tCYkJOckRWdjhOUFNFNDllRW9RUHBwVWp3dktGOWYzZWEy?=
 =?utf-8?B?dG9kMVlrL1UwK3hXR2ZKeGg5Z3NqWnk0V3RodkF1OWh4SU5QbTA3TUNhMHAw?=
 =?utf-8?B?N1ZlVkx4a0lJWnVqN0pwbEdSckNEcU9UbGZOT2dnRFNmT1Jyd0h4cC8weUZq?=
 =?utf-8?B?b2FreTdrdlZzaVIzZWQ0QTZoVHdJSGhHS01rMnZXelNBaS8yTUkrRktXSTN4?=
 =?utf-8?B?WEx2U0x6MWdTTGhTT2Jrb2FRY2ZWNjkreEhVemhwbXY3bkJtejJ4bmRwUG1w?=
 =?utf-8?B?OE1abXQvc09FZEpET1g5YnpJK1NXR254U1dId05yTkNXbW9YMlJ5UGdvcnVl?=
 =?utf-8?B?U2V2cmFVL3NZWjNsMXY1YzdOUW5FRGVna3lZdVVGd0JEODg2M0szRHozNjZK?=
 =?utf-8?B?d0JYT3dFQWg3Wlp2TFpGTkV3dlRTYWJJdTRra1g2ZmdIcVNQcnpRZHU3Ymxk?=
 =?utf-8?B?WFlyUXdrYkRpU05YUHZhRVlPVnppazM2Vi8zMFRzNmlFdE5nOTRPRUdiNjZJ?=
 =?utf-8?B?Mys5TmJXb2lyRG5kdGRnUFVRam4yc1c4NjJDa1g5UWtYbUFLUUpBNkNBSXp6?=
 =?utf-8?B?YTZFeTBTSCtJcms5WXJKenhMaVArR3RWWWdsQVdmT3kxb0VKbFlGdE1KektW?=
 =?utf-8?B?cjJoRURtYVJlU21lMkhNTU9HTVVxZ1RPOW9lbSs0N05aOEw4dWl4aXd4N2JY?=
 =?utf-8?B?RGpMSXhwa05TempleS91bzQ5WTBZMFd2bUxvMUYzeVAzZWMyMlJldnNFTnhX?=
 =?utf-8?B?YkJGZ0FkU1E3ZXhISm8zK0N3eXREbmlpcGQ2T0tnMnYyTE1aSHN3Nk5HWC9h?=
 =?utf-8?B?Y3RTNCtlS01DSFpuNmZxNlhVTlJsK3BXdlFiMXBtVUsrc2tBcUlIK05vYWNL?=
 =?utf-8?B?WGczL2tRQ252V2docmtrOUg5U3JOMm5YamgwMXFiMUc2Wko0K3hKT1JnMHFt?=
 =?utf-8?B?RlYxanRFWFJEVGV3bXV4T2U1ZTdRRVFCYkxNV3l1ajcxZDZ4T3RXeS92d3dp?=
 =?utf-8?B?bmR3SWtvL1NPcW96WVhnNkwvd3N3aElXQ3dKNVhhMkRBZFloaGpaVy9tWWlq?=
 =?utf-8?Q?2aUH/BAdmToMX7oyKlb4NNaC6qmuNQ=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe2f7d4-10f0-468b-c32d-08de450bbd57
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5520.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 05:49:45.8723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7099
X-Spam-Score: 2.5 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/27/25 9:24 AM, Chao Yu via Linux-f2fs-devel wrote:
 > On 12/26/2025 11:52 AM, Yongpeng Yang wrote: >> On 12/26/25 11:07, Chao
 Yu via Linux-f2fs-devel wrote: >>> On 12/23/2025 8:02 PM, Yongpeng Y [...]
 Content analysis details:   (2.5 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)outlook.com]
 2.7 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
 [52.103.74.75 listed in psbl.surriel.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.103.74.75 listed in wl.mailspike.net]
X-Headers-End: 1vZNBf-0001ml-GX
Subject: Re: [f2fs-dev] [PATCH] f2fs: drop non uptodata page during GC
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDEyLzI3LzI1IDk6MjQgQU0sIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6
Cj4gT24gMTIvMjYvMjAyNSAxMTo1MiBBTSwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4gT24gMTIv
MjYvMjUgMTE6MDcsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+PiBPbiAx
Mi8yMy8yMDI1IDg6MDIgUE0sIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+Pj4KPj4+PiBPbiAxMS8x
MC8yNSAxNzozMiwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+Pj4gT24g
MTEvMTAvMjUgMTc6MjAsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+Pj4+PiBPbiAxMS84LzI1IDEx
OjExLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4+Pj4+IFl1bmxlaSwK
Pj4+Pj4+Pgo+Pj4+Pj4+IE9uIDIwMjUvMTEvNyAxNDoyOSwgWXVubGVpIEhlIHdyb3RlOgo+Pj4+
Pj4+PiBGcm9tOiBZdW5sZWkgSGUgPGhleXVubGVpQHhpYW9taS5jb20+Cj4+Pj4+Pj4+Cj4+Pj4+
Pj4+IEdDIG1vdmUgZmJlIGRhdGEgYmxvY2sgd2lsbCBhZGQgc29tZSBub24gdXB0b2RhdGUgcGFn
ZSwgd2UnZAo+Pj4+Pj4+PiBiZXR0ZXIgcmVsZWFzZSBpdCBhdCB0aGUgZW5kLgo+Pj4+Pj4+Cj4+
Pj4+Pj4gVGhpcyBpcyBqdXN0IGZvciBzYXZpbmcgbWVtb3J5LCByaWdodD8KPj4+Pj4+Pgo+Pj4+
Pj4KPj4+Pj4+IFllcywgbW92ZV9kYXRhX2Jsb2NrKCkgZG9lc27igJl0IHJlYWQgYW55IGRhdGEg
dG8gZm9saW8sIGFuZCB0aGUgR0MKPj4+Pj4+IHVzdWFsbHkgc2VsZWN0cyBjb2xkIGRhdGEuIFRo
ZXJlZm9yZSwgdGhpcyBmb2xpbyBpcyB0eXBpY2FsbHkgbm90Cj4+Pj4+PiB1cHRvZGF0ZSwgYW5k
IHRoZXJl4oCZcyBubyBuZWVkIGZvciBpdCB0byBvY2N1cHkgdGhlIHBhZ2UgY2FjaGUuCj4+Pj4+
Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZdW5sZWkgSGUgPGhleXVubGVpQHhp
YW9taS5jb20+Cj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25n
cGVuZ0B4aWFvbWkuY29tPgo+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4gwqDCoMKgIGZzL2YyZnMvZ2Mu
YyB8IDUgKysrKysKPj4+Pj4+Pj4gwqDCoMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKPj4+Pj4+Pj4KPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZ2MuYyBiL2ZzL2YyZnMv
Z2MuYwo+Pj4+Pj4+PiBpbmRleCA4YWJmNTIxNTMwZmYuLjA5YjY1ZTZlYTg1MyAxMDA2NDQKPj4+
Pj4+Pj4gLS0tIGEvZnMvZjJmcy9nYy5jCj4+Pj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZ2MuYwo+Pj4+
Pj4+PiBAQCAtMTMxNSw2ICsxMzE1LDcgQEAgc3RhdGljIGludCBtb3ZlX2RhdGFfYmxvY2soc3Ry
dWN0IGlub2RlCj4+Pj4+Pj4+ICppbm9kZSwgYmxvY2tfdCBiaWR4LAo+Pj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoCBzdHJ1Y3Qgbm9kZV9pbmZvIG5pOwo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3QgZm9saW8gKmZvbGlvLCAqbWZvbGlvOwo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBibG9ja190
IG5ld2FkZHI7Cj4+Pj4+Pj4+ICvCoMKgwqAgYm9vbCBuZWVkX2ludmFsaWRhdGUgPSB0cnVlOwo+
Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBpbnQgZXJyID0gMDsKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKg
wqAgYm9vbCBsZnNfbW9kZSA9IGYyZnNfbGZzX21vZGUoZmlvLnNiaSk7Cj4+Pj4+Pj4+IMKgwqDC
oMKgwqDCoMKgIGludCB0eXBlID0gZmlvLnNiaS0+YW0uYXRnY19lbmFibGVkICYmIChnY190eXBl
ID09IAo+Pj4+Pj4+PiBCR19HQykgJiYKPj4+Pj4+Pj4gQEAgLTE0NTAsNyArMTQ1MSwxMSBAQCBz
dGF0aWMgaW50IG1vdmVfZGF0YV9ibG9jayhzdHJ1Y3QgaW5vZGUKPj4+Pj4+Pj4gKmlub2RlLCBi
bG9ja190IGJpZHgsCj4+Pj4+Pj4+IMKgwqDCoCBwdXRfb3V0Ogo+Pj4+Pj4+PiDCoMKgwqDCoMKg
wqDCoCBmMmZzX3B1dF9kbm9kZSgmZG4pOwo+Pj4+Pj4+PiDCoMKgwqAgb3V0Ogo+Pj4+Pj4+PiAr
wqDCoMKgIGlmIChmb2xpb190ZXN0X3VwdG9kYXRlKGZvbGlvKSkKPj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIG5lZWRfaW52YWxpZGF0ZSA9IGZhbHNlOwo+Pj4+Pj4+Cj4+Pj4+Pj4gSG93IGFib3V0
IGRyb3BwaW5nIHN1Y2ggZm9saW8gdW5kZXIgaXRzIGxvY2s/Cj4+Pj4+Pj4KPj4+Pj4+PiBpZiAo
IWZvbGlvX3Rlc3RfdXB0b2RhdGUoKSkKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoHRydW5jYXRlX2lu
b2RlX3BhcnRpYWxfZm9saW8oKQo+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gdHJ1bmNhdGVfaW5vZGVf
cGFydGlhbF9mb2xpbygpIGlzIG1vcmUgZWZmaWNpZW50IHNpbmNlIGl0IGF2b2lkcwo+Pj4+Pj4g
bG9va2luZwo+Pj4+Pj4gdXAgdGhlIGZvbGlvIGFnYWluLCBidXQgaXTigJlzIGRlY2xhcmVkIGlu
IG1tL2ludGVybmFsLmgsIHNvIGl0IAo+Pj4+Pj4gY2Fubm90IGJlCj4+Pj4+PiBjYWxsZWQgZGly
ZWN0bHkuCj4+Pj4+Cj4+Pj4+IFllYWgsIG9yIGdlbmVyaWNfZXJyb3JfcmVtb3ZlX2ZvbGlvKCks
IG5vdCBzdXJlLgo+Pj4+Pgo+Pj4+PiBJIGp1c3QgdGFrZSBhIGxvb2sgdG8gY2hlY2sgd2hldGhl
ciB0aGVyZSBpcyBhIGJldHRlciBhbHRlcm5hdGl2ZQo+Pj4+PiBzY2hlbWUuCj4+Pj4KPj4+PiBI
b3cgYWJvdXQgdGhlIGZvbGxvd2luZyBtb2RpZmljYXRpb24/IFRoZSBmb2xpbyBpcyBtYXJrZWQg
d2l0aAo+Pj4+IFBHX2Ryb3BiZWhpbmQgdXNpbmcgX19mb2xpb19zZXRfZHJvcGJlaGluZCgpLCBh
bmQgaXMgc3Vic2VxdWVudGx5Cj4+Pj4gcmVtb3ZlZCBmcm9tIHRoZSBwYWdlIGNhY2hlIHRocm91
Z2ggZm9saW9fZW5kX2Ryb3BiZWhpbmQoKS4KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+PiBZb25ncGVu
Zwo+Pj4+Cj4+Pj4gLS0tIGEvZnMvZjJmcy9nYy5jCj4+Pj4gKysrIGIvZnMvZjJmcy9nYy5jCj4+
Pj4gQEAgLTEzMjYsNiArMTMyNiw3IEBAIHN0YXRpYyBpbnQgbW92ZV9kYXRhX2Jsb2NrKHN0cnVj
dCBpbm9kZSAqaW5vZGUsCj4+Pj4gYmxvY2tfdCBiaWR4LAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBmb2xpbyA9IGYyZnNfZ3JhYl9jYWNoZV9mb2xpbyhtYXBwaW5nLCBiaWR4LCBmYWxzZSk7Cj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChJU19FUlIoZm9saW8pKQo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIoZm9saW8pOwo+Pj4+ICvCoMKg
wqDCoMKgwqAgX19mb2xpb19zZXRfZHJvcGJlaGluZChmb2xpbyk7Cj4+Pj4KPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKCFjaGVja192YWxpZF9tYXAoRjJGU19JX1NCKGlub2RlKSwgc2Vnbm8s
IG9mZikpIHsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IC1F
Tk9FTlQ7Cj4+Pj4gQEAgLTE0NTMsNyArMTQ1NCwxMCBAQCBzdGF0aWMgaW50IG1vdmVfZGF0YV9i
bG9jayhzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+Pj4+IGJsb2NrX3QgYmlkeCwKPj4+PiDCoMKgIHB1
dF9vdXQ6Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfcHV0X2Rub2RlKCZkbik7Cj4+Pj4g
wqDCoCBvdXQ6Cj4+Pj4gLcKgwqDCoMKgwqDCoCBmMmZzX2ZvbGlvX3B1dChmb2xpbywgdHJ1ZSk7
Cj4+Pj4gK8KgwqDCoMKgwqDCoCBmb2xpb191bmxvY2soZm9saW8pOwo+Pj4+ICvCoMKgwqDCoMKg
wqAgZm9saW9fZW5kX2Ryb3BiZWhpbmQoZm9saW8pOwo+Pj4+ICvCoMKgwqDCoMKgwqAgZm9saW9f
cHV0KGZvbGlvKTsKPj4+Cj4+PiBNYXliZToKPj4+Cj4+PiBvdXQ6Cj4+PiDCoMKgwqDCoMKgaWYg
KCFmb2xpb190ZXN0X3VwdG9kYXRlKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBmb2xpb19zZXRfZHJv
cGJlaGluZAo+Pj4gwqDCoMKgwqDCoGZvbGlvX3VubG9jawo+Pj4gwqDCoMKgwqDCoGZvbGlvX2Vu
ZF9kcm9wYmVoaW5kCj4+PiDCoMKgwqDCoMKgZm9saW9fdGVzdF9jbGVhcl9kcm9wYmVoaW5kIC8v
IG1ha2Ugc3VyZSB0byBjbGVhciB0aGUgZmxhZwo+IAo+IE9oLCBidHcsIGZvbGlvX3Rlc3RfY2xl
YXJfZHJvcGJlaGluZCgpIHNob3VsZCBiZSBjb3ZlcmVkIHcvIGZvbGlvIGxvY2suCj4gCgpZZXMs
IEkgb3Zlcmxvb2tlZCBpdC4gX19maWxlbWFwX2dldF9mb2xpb19tcG9sIHdpbGwgY2xlYXIKUEdf
ZHJvcGJlaGluZCBmbGFnIHdoZW4gZmdwX2ZsYWdzIC93byBGR1BfRE9OVENBQ0hFIGZsYWcuIFNv
LCB3ZSBkb24ndApuZWVkIHRvIGNsZWFyIGl0IGluIG1vdmVfZGF0YV9ibG9jay4gSSdsbCBkcm9w
IHRoaXMgaW4gdjMgcGF0Y2guCgpUaGFua3MKWW9uZ3BlbmcsCgo+Pgo+PiBPaCwgSSBtaXNzIHRo
aXMsIGZvbGlvX2VuZF9kcm9wYmVoaW5kLT5mb2xpb190cnlsb2NrIG1heSBmYWlsLiBJJ2xsIGZp
eAo+PiB0aGlzIGFuZCBzZW5kIHYyIHBhdGNoLgo+Pgo+PiBUaGFua3MKPj4gWW9uZ3BlbmcsCj4+
Cj4+PiDCoMKgwqDCoMKgZm9saW9fcHV0Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPj4+PiDCoMKgIH0KPj4+Pgo+Pj4+Pgo+Pj4+PiBUaGFu
a3MsCj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gWW9uZ3BlbmcsCj4+Pj4+Pgo+Pj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoCBmMmZzX2ZvbGlvX3B1dChmb2xpbywgdHJ1ZSk7Cj4+Pj4+Pj4+ICvCoMKgwqAgaWYg
KG5lZWRfaW52YWxpZGF0ZSkKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGludmFsaWRhdGVfbWFw
cGluZ19wYWdlcyhtYXBwaW5nLCBiaWR4LCBiaWR4KTsKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIGVycjsKPj4+Pj4+Pj4gwqDCoMKgIH0KPj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4KPj4+
Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+
Pj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+Pj4+Pj4gTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4+Pj4+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4+Pj4+Pgo+Pj4+Pgo+Pj4+Pgo+
Pj4+Pgo+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+Pj4+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4+PiBMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4+Pj4KPj4+Cj4+Pgo+Pj4KPj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKPj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwKPj4KPiAKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
